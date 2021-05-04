require 'rails_helper'

RSpec.describe Author, type: :model do
  it "can be created with valid data" do
    author = Author.new(name: "Caligula", phone_number: "5553054425")
    expect(author).to be_valid
  end
  
  describe 'Basic validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_length_of(:phone_number).is_equal_to(10) }
  end
end
