module DdocMacros
  D_CODE = <<-HTML
    <div class="code-sample">
      <div class="dlang">
        <ol class="code-lines">
          <li><code class="code-voice">$0</code></li>
        </ol>
      </div>
    </div>
  HTML

  D_KEYWORD = <<-HTML
    <span class="keyword">$0</span>
  HTML

  D_COMMENT = <<-HTML
    <span class="comment">$0</span>
  HTML

  D_STRING = <<-HTML
    <span class="string_literal">$0</span>
  HTML

  DDOC = <<-HTML
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">
        <link rel="stylesheet" type="text/css" href="file://#{TextMate::TextMateSession.current.env.bundle_support}/res/ddoc_theme.css">
      </head>
      <body id="reference" class="ddoc">
        <div class="height-container">
          $(BODY)
        </div>
      </body>
    </html>
  HTML

  DDOC_MODULE_MEMBERS = <<-HTML
    <section class="section symbol">
      $0
    </section>
  HTML

  DDOC_SUMMARY = <<-HTML
    <div class="abstract">
      <p class="para">
        $0
      </p>
    </div>
  HTML

  DDOC_DESCRIPTION = <<-HTML
    <div class="discussion">
      <h4>Discussion</h4>
      <p class="para">
        $0
      </p>
    </div>
  HTML

  DDOC_EXAMPLES = <<-HTML
    <h4>Examples</h4>
    <section class="code-listing">
      $0
    </section>
  HTML

  DDOC_RETURNS = <<-HTML
    <div class="result-description">
      <h4>Return Value</h4>
      <p class="para">
        $0
      </p>
    </div>
  HTML

  DDOC_PARAMS = <<-HTML
    <div class="parameters">
      <h4>Parameters</h4>
      <table cellspacing="0" cellpadding="5" border="0" class="graybox">
        <tbody>
          $0
        </tbody>
      </table>
    </div>
  HTML

  DDOC_PARAM_ROW = <<-HTML
    <tr>
      $0
    </tr>
  HTML

  DDOC_PARAM_ID = <<-HTML
    <td scope="row">
      <code class="code-voice"><em class="term">$0</em></code>
    </td>
  HTML

  DDOC_PARAM_DESC = <<-HTML
    <td>
      <div class="definition">
        <p class="para">
          $0
        </p>
      </div>
    </td>
  HTML

  DDOC_SECTION = <<-HTML
    <div class="non_standard_section">
      <p class="para">
        $0
      </p>
    </div>
  HTML

  DDOC_SECTION_H = <<-HTML
    <span class="section_h">$0</span>
  HTML

  D_INLINECODE = <<-HTML
    <code class="code-voice">$0</code>
  HTML

  def standard_section(name)
    <<-HTML
      <div class="#{name.downcase.gsub(' ', '_')}">
        <h4>#{name}</h4>
        <p class="para">
          $0
        </p>
      </div>
    HTML
  end

  # def ddoc_macros
  #   <<-DDOC
  #     Macros:
  #       EMPTY =
  #       COLON = :
  #
  #       D_CODE = #{D_CODE}
  #       D_KEYWORD = #{D_KEYWORD}
  #       D_INLINECODE = #{D_INLINECODE}
  #       D_COMMENT = #{D_COMMENT}
  #       D_STRING = #{D_STRING}
  #       D_PSYMBOL = D_PSYMBOL
  #
  #       DDOC = #{DDOC}
  #       DDOC_BLANKLINE = $(EMPTY)
  #       DDOC_COMMENT = <!-- $0 -->
  #
  #       DDOC_MODULE_MEMBERS = #{DDOC_MODULE_MEMBERS}
  #       DDOC_DECL = $(EMPTY)
  #       DDOC_DECL_DD = $0
  #       DDOC_SECTIONS = $0
  #       DDOC_SUMMARY = #{DDOC_SUMMARY}
  #       DDOC_DESCRIPTION = #{DDOC_DESCRIPTION}
  #       DDOC_EXAMPLES = #{DDOC_EXAMPLES}
  #       DDOC_RETURNS = #{DDOC_RETURNS}
  #       DDOC_PARAMS = #{DDOC_PARAMS}
  #       DDOC_PARAM_ROW = #{DDOC_PARAM_ROW}
  #       DDOC_PARAM_ID = #{DDOC_PARAM_ID}
  #       DDOC_PARAM_DESC = #{DDOC_PARAM_DESC}
  #       DDOC_LICENSE = #{standard_section('License')}
  #       DDOC_AUTHORS = #{standard_section('Authors')}
  #       DDOC_BUGS = #{standard_section('Bugs')}
  #       DDOC_COPYRIGHT = #{standard_section('Copyright')}
  #       DDOC_DATE = #{standard_section('Date')}
  #       DDOC_DEPRECATED = #{standard_section('Deprecated')}
  #       DDOC_HISTORY = #{standard_section('History')}
  #       DDOC_SEE_ALSO = #{standard_section('See Also')}
  #       DDOC_STANDARDS = #{standard_section('Standards')}
  #       DDOC_THROWS = #{standard_section('Throws')}
  #       DDOC_VERSION = #{standard_section('Version')}
  #       DDOC_SECTION = #{DDOC_SECTION}
  #       DDOC_SECTION_H = #{DDOC_SECTION_H}
  #
  #       DDOC_PSYMBOL = DDOC_PSYMBOL
  #       DDOC_BACKQUOTED = $(D_INLINECODE $0)
  #
  #       DDOC_DITTO = DDOC_DITTO
  #
  #       DDOC_MEMBERS = DDOC_MEMBERS
  #       DDOC_CLASS_MEMBERS = DDOC_CLASS_MEMBERS
  #       DDOC_STRUCT_MEMBERS = DDOC_STRUCT_MEMBERS
  #       DDOC_ENUM_MEMBERS = DDOC_ENUM_MEMBERS
  #       DDOC_TEMPLATE_MEMBERS = DDOC_TEMPLATE_MEMBERS
  #       DDOC_ENUM_BASETYPE = DDOC_ENUM_BASETYPE
  #       DDOC_ANCHOR = DDOC_ANCHOR
  #       DDOC_PSUPER_SYMBOL = DDOC_PSUPER_SYMBOL
  #       DDOC_KEYWORD = DDOC_KEYWORD
  #       DDOC_PARAM = DDOC_PARAM
  #   DDOC
  # end

  def ddoc_macros
    <<-DDOC
      Macros:
        LPAREN = (
        RPAREN = )
        BACKTICK = `
        DOLLAR = $

        B = <b>$0</b>
        I = <i>$0</i>
        U = <u>$0</u>
        P = <p>$0</p>
        DL = <dl>$0</dl>
        DT = <dt>$0</dt>
        DD = <dd>$0</dd>
        TABLE = <table>$0</table>
        TR = <tr>$0</tr>
        TH = <th>$0</th>
        TD = <td>$0</td>
        OL = <ol>$0</ol>
        UL = <ul>$0</ul>
        LI = <li>$0</li>
        BIG = <span class="font_big">$0</span>
        SMALL = <small>$0</small>
        BR = <br>
        LINK = <a href="$0">$0</a>
        LINK2 = <a href="$1">$+</a>
        DEPRECATED = $0

        RED = <span class="color_red">$0</span>
        BLUE = <span class="color_blue">$0</span>
        GREEN = <span class="color_green">$0</span>
        YELLOW = <span class="color_yellow">$0</span>
        BLACK = <span class="color_black">$0</span>
        WHITE = <span class="color_white">$0</span>

        D_CODE =
        <section class="code_listing">
          <div class="code_sample">
            <div class="dlang">
              <ol class="code_lines">
                <li><code class="code">$0</code></li>
              </ol>
            </div>
          </div>
        </section>

        D_INLINECODE = <code class="code">$0</code>
        DDOC_BACKQUOTED = $(D_INLINECODE $0)
        D_COMMENT = <span class="comment">$0</span>
        D_STRING = <span class="string_literal">$0</span>
        D_KEYWORD = <span class="keyword">$0</span>
        D_PSYMBOL = <span class="psymbol">$0</span>
        D_PARAM = <span class="param">$0</span>

        DDOC_BLANKLINE =
        DDOC_COMMENT = <!-- $0 -->

        DDOC =
        <!DOCTYPE html>
        <html>
          <head>
            <meta charset="UTF-8">
            <title>$(TITLE)</title>
            <link rel="stylesheet" type="text/css" href="file://#{TextMate::TextMateSession.current.env.bundle_support}/res/ddoc_theme.css">
          </head>
          <body id="ddoc_main" class="ddoc dlang">
            <div class="content_wrapper">
              <article class="module">
                <section id="module_content">$(BODY)</section>
              </article>
            </div>
          </body>
        </html>

        DDOC_MODULE_MEMBERS = <section class="section ddoc_module_members_section">
          <div class="ddoc_module_members">
            $(DDOC_MEMBERS $0)
          </div>
        </section>

        DDOC_CLASS_MEMBERS = $(DDOC_MEMBERS $0)
        DDOC_STRUCT_MEMBERS = $(DDOC_MEMBERS $0)
        DDOC_ENUM_MEMBERS = $(DDOC_MEMBERS $0)
        DDOC_TEMPLATE_MEMBERS = $(DDOC_MEMBERS $0)

        DDOC_MEMBERS = <ul class="ddoc_members">
          $0
        </ul>

        DDOC_MEMBER = <li class="ddoc_member">
          $0
        </li>

        DDOC_MEMBER_HEADER = <div class="ddoc_member_header">
          $0
        </div>

        DDOC_HEADER_ANCHOR = <div class="ddoc_header_anchor">
          <a href="#$1" id="$1"><code class="code">$2</code></a>
        </div>

        DDOC_DECL =

        DDOC_ANCHOR = <span class="ddoc_anchor" id="$1"></span>

        DDOC_DECL_DD = <div class="ddoc_decl">
          $0
        </div>

        DDOC_SECTIONS = <section class="section ddoc_sections">
          $0
        </section>

        DDOC_SUMMARY = <div class="ddoc_summary">
          <p class="para">
            $0
          </p>
        </div>

        DDOC_DESCRIPTION = <div class="ddoc_description">
          <h4>Discussion</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_EXAMPLES = <div class="ddoc_examples">
          <h4>Examples</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_RETURNS = <div class="ddoc_returns">
          <h4>Return Value</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_PARAMS = <div class="ddoc_params">
          <h4>Parameters</h4>
          <table cellspacing="0" cellpadding="5" border="0" class="graybox">
            <tbody>
              $0
            </tbody>
          </table>
        </div>

        DDOC_PARAM_ROW = <tr class="ddoc_param_row">
          $0
        </tr>

        DDOC_PARAM_ID = <td scope="ddoc_param_id">
          <code class="code">
            <em class="term">$0</em>
          </code>
        </td>

        DDOC_PARAM_DESC = <td>
          <div class="ddoc_param_desc">
            <p class="para">
              $0
            </p>
          </div>
        </td>

        DDOC_LICENSE = <div class="ddoc_license">
          <h4>License</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_AUTHORS = <div class="ddoc_authors">
          <h4>Authors</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_BUGS = <div class="ddoc_bugs">
          <h4>Bugs</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_COPYRIGHT = <div class="ddoc_copyright">
          <h4>Copyright</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_DATE = <div class="ddoc_date">
          <h4>Date</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_DEPRECATED = <div class="ddoc_deprecated">
          <h4>Deprecated</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_HISTORY = <div class="ddoc_history">
          <h4>History</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_SEE_ALSO = <div class="ddoc_see_also">
          <h4>See Also</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_STANDARDS = <div class="ddoc_standards">
          <h4>Standards</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_THROWS = <div class="ddoc_throws">
          <h4>Throws</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_VERSION = <div class="ddoc_version">
          <h4>Version</h4>
          <p class="para">
            $0
          </p>
        </div>

        DDOC_SECTION = <div class="ddoc_section">
          <p class="para">
            $0
          </p>
        </div>

        DDOC_SECTION_H = <span class="ddoc_section_h">$0</span>

        DDOC_DITTO = <br>
        $0

        DDOC_PSYMBOL = <code class="code">$0</code>
        DDOC_ENUM_BASETYPE = $0
        DDOC_PSUPER_SYMBOL = <span class="ddoc_psuper_symbol">$0</span>
        DDOC_KEYWORD = <code class="code">$0</code>
        DDOC_PARAM = <code class="code">$0</code>
        DDOC_CONSTRAINT = $(DDOC_CONSTRAINT) if ($0)
        DDOC_OVERLOAD_SEPARATOR = $0
        DDOC_TEMPLATE_PARAM_LIST = $0
        DDOC_TEMPLATE_PARAM = $0
    DDOC
  end
end
