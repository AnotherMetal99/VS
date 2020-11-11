require 'rails_helper'

RSpec.describe Mark, type: :model do
  it { is_expected.to belong_to(:lab_report) }
  it { is_expected.to validate_presence_of(:points) }
end
