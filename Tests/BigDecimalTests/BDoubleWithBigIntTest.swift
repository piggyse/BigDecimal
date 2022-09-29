//
//  File.swift
//  
//
//  Created by 박진섭 on 2022/09/28.
//

import Foundation
import XCTest
@testable import BigDecimal

class BDoubleWithBigIntTest: XCTestCase {

    func test_BDouble_init_With_BigInt_Instead_BInt() {

        // Big Number Test
        let very_Big_Double_Number = BDouble("1231289378912738912739817289371298312893719283781927398127389123123123123123123")
        let vert_Big_Double_From_BigInt = BDouble(BigInt("1231289378912738912739817289371298312893719283781927398127389123123123123123123"))

        XCTAssertEqual(very_Big_Double_Number, vert_Big_Double_From_BigInt)

        // Equal
        XCTAssertEqual(BDouble(1), BDouble(BigInt(1)))
        XCTAssertEqual(BDouble(1), BDouble(BigInt(1.0)))
        XCTAssertEqual(BDouble(1.0), BDouble(BigInt(1)))
        XCTAssertEqual(BDouble(1.0), BDouble(BigInt(1.0)))
        XCTAssertEqual(BDouble(2.0), BDouble(BigInt(2.0)))

        XCTAssertEqual(BDouble("1"), BDouble(BigInt("1")))
        XCTAssertEqual(BDouble("1.0"), BDouble(BigInt("1")))
        XCTAssertEqual(BDouble("1.0"), BDouble(BigInt("1")))
        XCTAssertEqual(BDouble("2.0"), BDouble(BigInt("2")))
        XCTAssertEqual(BDouble(0), BDouble(BigInt("0")))
        XCTAssertEqual(BDouble(0.0), BDouble(BigInt("0")))

        // Not equal
        XCTAssertNotEqual(BDouble(1), BDouble(BigInt(-1)))
        XCTAssertNotEqual(BDouble(2), BDouble(BigInt(1.0)))
        XCTAssertNotEqual(BDouble(-1.0), BDouble(BigInt(1)))
        XCTAssertNotEqual(BDouble(3.3), BDouble(BigInt(3.3)))
        XCTAssertNotEqual(BDouble("-1"), BDouble(BigInt("1")))
        XCTAssertNotEqual(BDouble("1.0"), BDouble(BigInt("-1")))

        // sign
        XCTAssertEqual(BDouble(-1), BDouble(BigInt(-1)))
        XCTAssertEqual(BDouble(-1.0), BDouble(BigInt(-1)))
        XCTAssertEqual(BDouble(-1), BDouble(BigInt(-1.0)))
        XCTAssertEqual(BDouble(-1.0), BDouble(BigInt(-1.0)))
        XCTAssertEqual(BDouble("-1"), BDouble(BigInt("-1")))
        XCTAssertEqual(BDouble("-2"), BDouble(BigInt("-2")))

        // Random
        for _ in 0..<100 {
            let random_Double = Double(arc4random())
            let random_BigInt_From_Random_Double = BigInt(random_Double)
            XCTAssertEqual(BDouble(random_Double), BDouble(random_BigInt_From_Random_Double))
        }
    }

    func test_plus_operator_BDouble_With_BigInt() {

        // given
        let random_Int_Number = Int(arc4random()) // UInt32 - 1
        let sample_Double = 1.001

        let expected_Number = BDouble(random_Int_Number + sample_Double)

        let random_Big_Int: BigInt = BigInt(random_Int_Number)
        let sample_Big_Double: BDouble = BDouble(sample_Double)

        // when
        let plus_Case_1 = random_Big_Int + sample_Big_Double
        let plus_Case_2 = sample_Big_Double + random_Big_Int

        // then
        XCTAssertEqual(plus_Case_1, expected_Number)
        XCTAssertEqual(plus_Case_2, expected_Number)


        // given
        let sample_String_Int = "100000000000000000000"
        let sample_String_Double = "100000000000000000000.21341235345345"

        let expected_Big_Number = BDouble("200000000000000000000.21341235345345")

        let bigInt_From_String: BigInt = BigInt.init(stringLiteral: sample_String_Int)
        let bigDouble_From_String: BDouble = BDouble(sample_String_Double)!

        // when
        let plus_Case_3 = bigInt_From_String + bigDouble_From_String
        let plus_Case_4 = bigDouble_From_String + bigInt_From_String

        // then
        XCTAssertEqual(plus_Case_3, expected_Big_Number)
        XCTAssertEqual(plus_Case_4, expected_Big_Number)

    }

    func test_Minus_operator_BDouble_With_BigInt() {

        // given
        let random_Int_Number = Int(arc4random()) // UInt32 - 1
        let sample_Double = 1.001

        let expected_Number_1 = BDouble(sample_Double) - BDouble(random_Int_Number)
        let expected_Number_2 = BDouble(random_Int_Number) - BDouble(sample_Double)


        let random_Big_Int: BigInt = BigInt(random_Int_Number)
        let sample_Big_Double: BDouble = BDouble(sample_Double)

        // when
        let minus_Case_1 = sample_Big_Double - random_Big_Int
        let minus_Case_2 = random_Big_Int - sample_Big_Double

        // then
        XCTAssertEqual(minus_Case_1, expected_Number_1)
        XCTAssertEqual(minus_Case_2, expected_Number_2)

    }

    func test_Multiplication_operator_BDouble_With_BigInt() {

        // given
        let random_Int_Number = Int(arc4random()) // UInt32 - 1
        let sample_Double = 1.001

        let expected_Number = BDouble(sample_Double) * BDouble(random_Int_Number)

        let random_Big_Int: BigInt = BigInt(random_Int_Number)
        let sample_Big_Double: BDouble = BDouble(sample_Double)

        // when
        let multiplication_Case_1 = sample_Big_Double * random_Big_Int
        let multiplication_Case_2 = random_Big_Int * sample_Big_Double

        // then
        XCTAssertEqual(multiplication_Case_1, expected_Number)
        XCTAssertEqual(multiplication_Case_2, expected_Number)
    }

    func test_Division_operator_BDouble_With_BigInt() {
        // given
        let random_Int_Number = Double(arc4random()) // UInt32 - 1
        let sample_Double = 1.001
        
        let expected_Number_1 = BDouble(sample_Double) / BDouble(random_Int_Number)
        let expected_Number_2 = BDouble(random_Int_Number) / BDouble(sample_Double)

        let random_Big_Int: BigInt = BigInt(random_Int_Number)
        let sample_Big_Double: BDouble = BDouble(sample_Double)

        // when
        let division_Case_1 = sample_Big_Double / random_Big_Int
        let division_Case_2 = random_Big_Int / sample_Big_Double

        // then
        XCTAssertEqual(division_Case_1, expected_Number_1)
        XCTAssertEqual(division_Case_2, expected_Number_2)
    }

//MARK: -- Assignment Operator
    func test_Plus_Assignment_Operator() {
        // given
        var sample_BigDouble_1 = BDouble(100.1)
        var sample_BigDouble_2 = BDouble(100.1)
        let sample_BigInt_1 = BigInt(1)
        let sample_BigInt_2 = BigInt("1000000000000000000000000000000")

        let expected_BigDouble_1 = BDouble(103.1)
        let expected_BigDouble_2 = BDouble("3000000000000000000000000000100.1")

        // when
        for _ in 0..<3 {
            sample_BigDouble_1 += sample_BigInt_1
            sample_BigDouble_2 += sample_BigInt_2
        }

        // then
        XCTAssertEqual(sample_BigDouble_1, expected_BigDouble_1)
        XCTAssertEqual(sample_BigDouble_2, expected_BigDouble_2)
    }

    func test_Minus_Assignment_Operator() {
        // given
        var sample_BigDouble_1 = BDouble(103.1)
        var sample_BigDouble_2 = BDouble("3000000000000000000000000000100.1")!
        var sample_BigDouble_3 = BDouble(1)

        let sample_BigInt_1 = BigInt(1)
        let sample_BigInt_2 = BigInt("1000000000000000000000000000000")
        let sample_BigInt_3 = BigInt(5)

        let expected_BigDouble_1 = BDouble(100.1)
        let expected_BigDouble_2 = BDouble(100.1)
        let expected_BigDouble_3 = BDouble(-14)

        // when
        for _ in 0..<3 {
            sample_BigDouble_1 -= sample_BigInt_1
            sample_BigDouble_2 -= sample_BigInt_2
            sample_BigDouble_3 -= sample_BigInt_3
        }

        // then
        XCTAssertEqual(sample_BigDouble_1, expected_BigDouble_1)
        XCTAssertEqual(sample_BigDouble_2, expected_BigDouble_2)
        XCTAssertEqual(sample_BigDouble_3, expected_BigDouble_3)
    }

    func test_Multiplication_Assignment_Operator() {
        // given
        var sample_BigDouble_1 = BDouble(-5)
        var sample_BigDouble_2 = BDouble(323)
        var sample_BigDouble_3 = BDouble(1258193)
        var sample_BigDouble_4 = BDouble(0)
        var sample_BigDouble_5 = BDouble(12312421353425)

        let sample_BigInt_1 = BigInt(-2)
        let sample_BigInt_2 = BigInt("-1000000000000000000000000000000")
        let sample_BigInt_3 = BigInt(5)
        let sample_BigInt_4 = BigInt(0)
        let sample_BigInt_5 = BigInt(0)


        let expected_BigDouble_1 = BDouble(40)
        let expected_BigDouble_2 = BDouble("-323000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")
        let expected_BigDouble_3 = BDouble(157274125)
        let expected_BigDouble_4 = BDouble(0)
        let expected_BigDouble_5 = BDouble(0)

        // when
        for _ in 0..<3 {
            sample_BigDouble_1 *= sample_BigInt_1
            sample_BigDouble_2 *= sample_BigInt_2
            sample_BigDouble_3 *= sample_BigInt_3
            sample_BigDouble_4 *= sample_BigInt_4
            sample_BigDouble_5 *= sample_BigInt_5
        }

        // then
        XCTAssertEqual(sample_BigDouble_1, expected_BigDouble_1)
        XCTAssertEqual(sample_BigDouble_2, expected_BigDouble_2)
        XCTAssertEqual(sample_BigDouble_3, expected_BigDouble_3)
        XCTAssertEqual(sample_BigDouble_4, expected_BigDouble_4)
        XCTAssertEqual(sample_BigDouble_5, expected_BigDouble_5)
    }

    func test_Division_Assignment_Operator() {
        // given
        var sample_BigDouble_1 = BDouble(40)
        var sample_BigDouble_2 = BDouble("-323000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")!
        var sample_BigDouble_3 = BDouble(157274125)

        let sample_BigInt_1 = BigInt(-2)
        let sample_BigInt_2 = BigInt("-1000000000000000000000000000000")
        let sample_BigInt_3 = BigInt(5)

        let expected_BigDouble_1 = BDouble(-5)
        let expected_BigDouble_2 = BDouble(323)
        let expected_BigDouble_3 = BDouble(1258193)

        // when
        for _ in 0..<3 {
            sample_BigDouble_1 /= sample_BigInt_1
            sample_BigDouble_2 /= sample_BigInt_2
            sample_BigDouble_3 /= sample_BigInt_3
        }

        // then
        XCTAssertEqual(sample_BigDouble_1, expected_BigDouble_1)
        XCTAssertEqual(sample_BigDouble_2, expected_BigDouble_2)
        XCTAssertEqual(sample_BigDouble_3, expected_BigDouble_3)
    }
}
