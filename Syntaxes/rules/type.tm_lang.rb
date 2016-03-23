trait :type do
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
end

