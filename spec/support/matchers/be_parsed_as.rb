RSpec::Matchers.define :be_parsed_as do |scope|
  attr_reader :code
  attr_reader :rule
  attr_reader :scope
  attr_reader :parsed_scope
  attr_reader :parsed_code_extract

  match do |code_extract|
    @scope = scope
    write_code
    generate_grammar
    result = match_grammar
    result = filter_result(result)
    extract_result!(result)
    result_matches?(code_extract)
  end

  description do
    %(be parsed as "#{scope}" in code "#{code}")
  end

  failure_message do |subject|
    %(expected: "#{subject}" to be parsed as "#{scope}" in code "#{code}"\n) +
      %(     got: "#{parsed_code_extract}" parsed as "#{parsed_scope}")
  end

  failure_message_when_negated do |subject|
    %(expected: "#{subject}" not to be parsed as "#{scope}" in code "#{code}") +
      %(\n     got: "#{parsed_code_extract}" parsed as "#{parsed_scope}")
  end

  def in_code(code)
    tap { @code = code }
  end

  def with_rule(rule)
    tap { @rule = rule }
  end

  private

  def grammar_path
    @grammar_path ||= create_temp_file('grammar')
  end

  def code_path
    @code_path ||= create_temp_file('code')
  end

  def generate_grammar
    `tm_grammar -r #{rule} Syntaxes/d.tm_lang.rb > #{grammar_path}`
  end

  def match_grammar
    `gtm < "#{code_path}" "#{grammar_path}" 2>&1`
  end

  def write_code
    File.write(code_path, code)
  end

  def create_temp_file(prefix)
    file = Tempfile.new(prefix)
    DMate::Support::TempFiles.files << file
    file.path
  end

  def filter_result(result)
    lines = result.split("\n")
    filtered_lines = lines.reject { |e| lines_to_filter.include?(e) }
    result = filtered_lines.join("\n")
    "<#{root_name}>#{result}</#{root_name}>"
  end

  def extract_result!(result)
    root = Nokogiri::XML(result).root
    children = root.children
    node = find_node(children)
    node ||= children.find(&:element?) || root

    @parsed_scope = node.name
    @parsed_code_extract = node.content
  end

  def find_node(nodes)
    node = nodes.find { |e| e.element? && e.name == scope }
    node || find_node_among_children(nodes)
  end

  def find_node_among_children(nodes)
    nodes = nodes.select { |node| node.children.any?(&:element?) }
    nodes = nodes.map { |node| find_node(node.children) }
    nodes.find(&:present?)
  end

  def result_matches?(code_extract)
    parsed_scope == scope && parsed_code_extract == code_extract
  end

  def lines_to_filter
    @lines_to_filter ||= [
      'grammar_for_scope: unable to find a grammar for ‘text.html.javadoc’',
      '*** couldn’t resolve text.html.javadoc',
      '*** couldn’t resolve #regular_expressions',
      'failed to resolve text.html.javadoc'
    ].freeze
  end

  def root_name
    @root_name ||= 'unscoped'
  end
end
