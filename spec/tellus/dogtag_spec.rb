# frozen_string_literal: true

require 'support/dummy'

RSpec.describe Tellus::Dogtag do
  it 'has a version number' do
    expect(Tellus::Dogtag::VERSION).not_to be nil
  end

  describe 'utility methods' do
    subject { described_class }

    let(:dummy) { Dummy.valid_instance }

    before do
      Tellus::Dogtag::DataType.data_types = {
        'Dummy' => 0,
      }
    end

    describe '.data_type_for' do
      it 'searches the data_types hash' do
        expect(subject.data_type_for(dummy.class.name)).to eq(
          dummy.dogtag_data_type
        )
      end
    end

    describe '.find' do
      context 'with a valid ID' do
        it 'returns the object' do
          expect(subject.find(dummy.id)).to eq dummy
        end
      end

      context 'with a non existing ID mapping to a valid class' do
        it 'returns nil' do
          expect(subject.find(1)).to eq nil
        end
      end

      context 'with an invalid ID' do
        it 'returns nil' do
          expect(subject.find(123123123)).to eq nil
        end
      end
    end

    describe '.find!' do
      context 'with a valid ID' do
        it 'returns the object' do
          expect(subject.find!(dummy.id)).to eq dummy
        end
      end

      context 'with a non existing ID mapping to a valid class' do
        it 'raises error' do
          expect { subject.find!(1) }.to raise_error(StandardError)
        end
      end

      context 'with an invalid ID' do
        it 'returns nil' do
          expect(subject.find!(123123123)).to eq nil
        end
      end
    end

    describe '.exists?' do
      context 'when the record exists' do
        it 'returns true' do
          expect(subject.exists?(dummy.id)).to eq true
        end
      end

      context "when the record doesn't exist" do
        it 'returns true' do
          expect(subject.exists?(123)).to eq false
        end
      end
    end

    describe '.data_type_from' do
      context 'happy path' do
        it 'returns the class name for the ID' do
          expect(subject.data_type_from(dummy.id)).to eq 0
        end
      end
    end
  end
end
