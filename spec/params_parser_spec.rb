require 'spec_helper'

describe ParamsParser do
  let(:input) { { a: :a, b: :b, c: :c } }
  describe 'Class Methods' do
    describe '.transform_and_send_request' do
      context 'no params passed' do
        it { expect { ParamsParser.transform_and_send_request }.to raise_error(ParamsParser::EmptyParamsError) }
      end
      context 'params passed' do
        before { allow(RequestSenderService).to receive(:deliver).and_return(true) }
        it { expect { ParamsParser.transform_and_send_request(input) }.not_to raise_error }
      end
    end
  end
end