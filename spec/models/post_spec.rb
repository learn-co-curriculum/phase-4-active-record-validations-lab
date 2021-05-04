require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'can be created with valid data' do
    post = Post.new(
      title: "You Won't Believe These True Facts",
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dapibus, nulla vel condimentum ornare, arcu lorem hendrerit purus, ac sagittis ipsum nisl nec erat. Morbi porta sollicitudin leo, eu cursus libero posuere ac. Sed ac ultricies ante. Donec nec nulla ipsum. Nunc eleifend, ligula ut volutpat.',
      summary: 'Abstract.',
      category: 'Fiction'
    )
    expect(post).to be_valid
  end
  
  describe 'Basic validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_length_of(:content).is_at_least(250) }
    it { is_expected.to validate_length_of(:summary).is_at_most(250) }
    it { is_expected.to validate_inclusion_of(:category).in_array(['Fiction', 'Non-Fiction']) }
  end
  
  describe 'Custom validations' do
    it { is_expected.not_to allow_value('True Facts').for(:title) }
  end
end
