require 'spec_helper'

module FibonacciService
  describe Sequence do
    let(:size)   { '3' }
    let(:sequence) { Sequence.new(size) }

    describe ".new" do
      it "sets the size as an integer" do
        expect(sequence.size).to eq(size.to_i)
      end

      context "with a zero" do
        let(:size) { '0' }

        it "raises an InvalidNumber error" do
          expect { Sequence.new(size) }.
            to raise_exception(InvalidNumberError, "number must not be 0")
        end
      end

      context "with a negative size" do
        let(:size) { '-1' }

        it "raises and InvalidNumber error" do
          expect { Sequence.new(size) }.
            to raise_exception(InvalidNumberError, "number must be positive")
        end
      end

      context "with a non-integer size" do
        let(:size) { '1.2' }

        it "raises an InvalidNumber error" do
          expect { Sequence.new(size) }.
            to raise_exception(InvalidNumberError, "number must be an integer")
        end
      end
    end

    describe "#cached_fibonacci" do

      context "when the number is 0" do
        let(:number) { 0 }
        let(:collection) { [] }

        it "returns 0" do
          expect(sequence.cached_fibonacci(number, collection)).to eq(0)
        end
      end

      context "when the number is 1" do
        let(:number) { 1 }
        let(:collection) { [0] }

        it "returns 0" do
          expect(sequence.cached_fibonacci(number, collection)).to eq(1)
        end
      end

      context "when the number is 2" do
        let(:number) { 2 }
        let(:collection) { [0,1] }

        it "returns 1" do
          expect(sequence.cached_fibonacci(number, collection)).to eq(1)
        end
      end

      context "when the number is 3" do
        let(:number) { 3 }
        let(:collection) { [0,1,1] }

        it "returns 2" do
          expect(sequence.cached_fibonacci(number, collection)).to eq(2)
        end
      end
    end

    describe "#fibonacci" do
      context "when the number is 0" do
        let(:number) { 0 }

        it "returns 0" do
          expect(sequence.fibonacci(number)).to eq(0)
        end
      end

      context "when the number is 1" do
        let(:number) { 1 }

        it "returns 0" do
          expect(sequence.fibonacci(number)).to eq(1)
        end
      end

      context "when the number is 2" do
        let(:number) { 2 }

        it "returns 1" do
          expect(sequence.fibonacci(number)).to eq(1)
        end
      end

      context "when the number is 3" do
        let(:number) { 3 }

        it "returns 2" do
          expect(sequence.fibonacci(number)).to eq(2)
        end
      end
    end

    describe "#sequence" do
      it "returns an array of sequenced numbers" do
        expect(sequence.sequence).to be_kind_of(Array)
      end

      it "returns a collection the size of the number" do
        expect(sequence.sequence.size).to eq(size.to_i)
      end

      context "when the size is 1" do
        let(:size) { 1 }

        it "returns 0 as the single item" do
          expect(sequence.sequence).to eq([0])
        end
      end

      context "when the size is 2" do
        let(:size) { 2 }

        it "returns 0,1 as the collection" do
          expect(sequence.sequence).to eq([0,1])
        end
      end

      context "when the size is 3" do
        let(:size) { 3 }

        it "returns 0,1,1 as the collection" do
          expect(sequence.sequence).to eq([0,1,1])
        end
      end

      context "when the size is 5" do
        let(:size) { 5 }

        it "returns 0,1,1,2,3 as the collection" do
          expect(sequence.sequence).to eq([0,1,1,2,3])
        end
      end

      context "when the size is 500" do
        let(:size) { '500' }

        it "returns 500 items in the collection" do
          expect(sequence.sequence.size).to eq(size.to_i)
        end
      end
    end

    describe "#to_json" do

    end
  end
end
