trait :other do
  rule 'character' do
    name 'support.other.character.d'
    match /[^"]/
  end

  rule 'end_of_line' do
    name 'support.other.end-of-line.d'
    match /$/
  end

  rule 'white_space' do
    name 'support.other.white-space.d'
    match { one_or_more(space) }
  end

  rule 'space' do
    name 'support.other.space.d'
    match '[\x{0020}\x{0009}]'
  end

  rule 'identifier' do
    name 'support.other.identifier.d'
    match { identifier_start + identifier_chars? }
  end

  rule 'identifier_start' do
    name 'support.other.identifier-start.d'
    match '_|\p{L}'
  end

  rule 'identifier_chars' do
    name 'support.other.identifier-chars.d'
    match { one_or_more(identifier_char) }
  end

  rule 'identifier_char' do
    name 'support.other.identifier-char.d'
    match { identifier_start | `0` | non_zero_digit }
  end

  rule 'named_character_entity' do
    name 'support.other.named-character-entity.d'
    match { `&` + identifier + `;` }
  end

  rule 'keyword' do
    pattern { include '#keyword_variable' }
    pattern { include '#keyword_constant' }
    pattern { include '#special_keyword' }
    pattern { include '#keyword_control' }
    pattern { include '#keyword_storage_type' }
    pattern { include '#keyword_storage_modifier' }
    pattern { include '#keyword_other' }
  end

  rule 'keyword_variable' do
    VARIABLES = %w(
      this super
    ).join('|').freeze

    name 'variable.language.d'
    match "\\b(?:#{VARIABLES})\\b"
  end

  rule 'keyword_constant' do
    CONSTANTS = %w(
      true false null
    ).join('|').freeze

    name 'constant.language.d'
    match "\\b(?:#{CONSTANTS})\\b"
  end

  rule 'special_keyword' do
    SPECIAL_KEYWORD = %w(
      __FILE__ __MODULE__ __LINE__ __FUNCTION__ __PRETTY_FUNCTION__
    ).join('|').freeze

    name 'constant.language.d'
    match "\\b(?:#{SPECIAL_KEYWORD})\\b"
  end

  rule 'keyword_control' do
    CONTROL_KEYWORDS = %w(
      break
      case catch continue
      default do
      else
      finally for foreach foreach_reverse
      goto
      if
      return
      switch
      throw try
      while
    ).join('|').freeze

    name 'keyword.control.d'
    match "\\b(?:#{CONTROL_KEYWORDS})\\b"
  end

  rule 'keyword_storage_type' do
    STORAGE_TYPES = %w(
      class
      bool byte
      cdouble cent cfloat char creal
      dchar delegate double
      enum
      float function
      idouble ifloat
      int interface
      ireal
      long
      real
      short
      struct
      template
      ubyte ucent uint ulong union
      ushort
      void
      wchar
      __vector
    ).join('|').freeze

    name 'storage.type.d'
    match "\\b(?:#{STORAGE_TYPES})\\b"
  end

  rule 'keyword_storage_modifier' do
    STORAGE_MODIFIERS = %w(
      abstract
      const
      final
      immutable
      package private protected public
      static
      shared
    ).join('|').freeze

    name 'storage.modifier.d'
    match "\\b(?:#{STORAGE_MODIFIERS})\\b"
  end

  rule 'keyword_other' do
    KEYWORDS = %w(
      alias align asm assert auto
      body
      cast
      debug delete deprecated
      export extern
      import in inout invariant
      lazy
      macro mixin module
      new nothrow
      out override
      pragma pure
      ref
      scope synchronized
      typedef typeid typeof
      unittest
      version volatile
      with
      __gshared __traits __parameters
    ).join('|').freeze

    name 'keyword.other.d'
    match "\\b(?:#{KEYWORDS})\\b"
  end

  rule 'operator' do
    match { deprecated_operator | operator_impl }
  end

  array_to_regexp = -> (array) { array.map { |e| Regexp.escape(e) }.join('|') }

  rule 'operator_impl' do
    OPERATORS = array_to_regexp.call(%w(
      /= / ... .. . &= && & |= | || -= -- - += ++ + <= << <<= < >= >>= >>>= >>
      >>> > != ! ( ) [ ] { } ? , ; : $ => == = *= * %= % ^= ^^ ^^= ^ ~= ~ @ #
      is
    )).freeze

    name 'keyword.operator.d'
    match /(?:#{OPERATORS})/
  end

  rule 'deprecated_operator' do
    DEPRECATED_OPERATORs = array_to_regexp.call(
      %w(<>= <> !<>= !<> !<= !< !>= !>)
    ).freeze

    name 'keyword.operator.deprecated.d'
    match /(?:#{DEPRECATED_OPERATORs})/
  end
end
