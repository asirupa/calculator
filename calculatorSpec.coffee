describe 'CalculatorTest', ->
    calculator = new Calculator()
    it 'test process click should echo input', ->
        result = calculator.processClickInput "123"
        expect(result).toBe "123"
    it 'test process click should filter input-alphabet', ->
        result = calculator.processClickInput "123randomtextwhichisnotallowed"
        expect(result).toBe "123"
    it 'test process click should allow arithmetic operations', ->
        result = calculator.processClickInput "1+2+3+4"
        expect(result).toBe "1+2+3+4"
    it 'test process click should remove leading 0 and trailing spaces', ->
        result = calculator.processClickInput " 01+2+3+4 "
        expect(result).toBe "1+2+3+4"
    it 'test process key should echo input', ->
        result = calculator.processKeyInput "123"
        expect(result).toBe "123"
    it 'test process key should filter input-alphabet', ->
        result = calculator.processKeyInput "123randomtextwhichisnotallowed"
        expect(result).toBe "123"
    it 'test process key should allow arithmetic operations', ->
        result = calculator.processKeyInput "1+2+3+4"
        expect(result).toBe "1+2+3+4"
    it 'test process key should remove leading 0 and trailing spaces', ->
        result = calculator.processKeyInput " 01+2+3+4 "
        expect(result).toBe "1+2+3+4"
