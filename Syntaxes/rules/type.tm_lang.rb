trait :type do
  rule 'type_ctors' do
    name 'support.other.type-ctors.d'
    match { type_ctor + optional(`\\s+` + type_ctor) }
  end

  rule 'type_ctor' do
    TYPE_CONSTRUCTORS = %w(const immutable inout shared).join('|').freeze

    name 'storage.modifier.type-constructor.d'
    match /\b(?:#{TYPE_CONSTRUCTORS})\b/
  end

  rule 'basic_type_x' do
    BASIC_TYPES = %w(
      bool
      byte
      ubyte
      short
      ushort
      int
      uint
      long
      ulong
      char
      wchar
      dchar
      float
      double
      real
      ifloat
      idouble
      ireal
      cfloat
      cdouble
      creal
      void
    ).join('|').freeze

    name 'storage.type.basic.d'
    match /\b(?:#{BASIC_TYPES})\b/
  end

  rule 'typeof' do
    name 'meta.typeof.d'

    match do
      word_boundary(:typeof) + '\s*\(\s*' + word_boundary(:return) + '\s*\)'
    end

    capture :typeof, 'storage.modifier.typeof.d'
    capture :return, 'keyword.control.return.d'
  end
end

