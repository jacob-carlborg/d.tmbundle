require 'spec_helper'

describe 'expression' do
  describe 'unary_expression' do
    let(:rule) { 'unary_expression' }
    let(:scope) { 'support.other.unary-expression.d' }

    describe '&false++false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '++false--true' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '--false*false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '*false-false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '-false+false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '+false!true' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '!false true' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'true&false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'base_unary_expression' do
      let(:scope) { 'support.other.base-unary-expression2.d' }

      describe 'false ++ false' do
        let(:code) { '& false ++ false' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'false -- true' do
        let(:code) { '++ false -- true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'false * false' do
        let(:code) { '-- false * false' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'false - false' do
        let(:code) { '* false - false' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'false + false' do
        let(:code) { '- false + false' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'false ! true' do
        let(:code) { '+ false ! true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'false true' do
        let(:code) { '! false true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe ' & false' do
        let(:code) { 'true & false' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end

  describe 'base_unary_expression2' do
    let(:rule) { 'base_unary_expression2' }
    let(:scope) { 'support.other.base-unary-expression2.d' }

    describe 'true' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe ' &false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe ' ++false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe ' --false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe ' *false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe ' -false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe ' +false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe ' !false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'base_unary_expression' do
      let(:scope) { 'support.other.base-unary-expression.d' }

      describe 'true' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe 'true' do
        let(:code) { '& true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'true' do
        let(:code) { '++ true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'true' do
        let(:code) { '-- true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'true' do
        let(:code) { '* true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'true' do
        let(:code) { '- true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'true' do
        let(:code) { '+ true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'true' do
        let(:code) { '! true' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end

  describe 'base_unary_expression' do
    let(:rule) { 'base_unary_expression' }
    let(:scope) { 'support.other.base-unary-expression.d' }

    describe 'false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'pow_expression' do
      let(:scope) { 'support.other.pow-expression.d' }

      describe 'true' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end
  end

  describe 'pow_expression' do
    let(:rule) { 'pow_expression' }
    let(:scope) { 'support.other.pow-expression.d' }

    describe 'false' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'primary_expression' do
      let(:scope) { 'support.other.postfix-expression.d' }

      describe 'true' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end
  end

  describe 'postfix_expression' do
    let(:rule) { 'postfix_expression' }
    let(:scope) { 'support.other.postfix-expression.d' }

    describe 'true' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'true.foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo++' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo--' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'base_postfix_expression' do
      let(:scope) { 'support.other.base-postfix-expression.d' }

      describe 'false' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      context '.identifier' do
        let(:code) { 'false . bar' }

        describe 'false' do
          it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
        end

        describe 'bar' do
          let(:scope) { 'support.other.identifier.d' }
          it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
        end
      end

      context '++' do
        let(:code) { 'foo++' }

        describe 'foo' do
          it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
        end
      end

      context '--' do
        let(:code) { 'foo--' }

        describe 'foo' do
          it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
        end
      end
    end
  end

  describe 'base_postfix_expression' do
    let(:rule) { 'base_postfix_expression' }
    let(:scope) { 'support.other.base-postfix-expression.d' }

    describe 'true' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'primary_expression' do
      let(:scope) { 'support.other.primary-expression.d' }

      describe 'false' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end
  end

  describe 'primary_expression' do
    let(:rule) { 'primary_expression' }
    let(:scope) { 'support.other.primary-expression.d' }

    describe '$' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0.2_45_658938_302_e-34' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '328_284L' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "'a'" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'int.foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'char . bar' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'typeof(return)' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'super' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'true' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '__FILE__' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '.foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'float_literal' do
      let(:scope) { 'constant.numeric.float.d' }

      describe '328_284fi' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'integer_literal' do
      let(:scope) { 'constant.numeric.integer.d' }

      describe '0b1010_110101UL' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'character_literal' do
      let(:scope) { 'string.quoted.single.d' }

      describe "'b'" do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'basic_type_x_identifier' do
      let(:code) { 'int.foo' }

      describe 'int' do
        let(:scope) { 'storage.type.basic.d' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'foo' do
        let(:scope) { 'support.other.identifier.d' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end

    context 'typeof' do
      describe 'typeof(return)' do
        let(:scope) { 'meta.typeof.d' }
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'keyword_variable' do
      let(:scope) { 'variable.language.d' }

      describe 'this' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'keyword_constant' do
      let(:scope) { 'constant.language.d' }

      describe 'false' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'special_keyword' do
      let(:scope) { 'constant.language.d' }

      describe '__MODULE__' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'identifier' do
      describe 'foo' do
        let(:scope) { 'support.other.identifier.d' }

        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe 'foo' do
        let(:code) { '.foo' }
        let(:scope) { 'support.other.identifier.d' }

        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end
end
