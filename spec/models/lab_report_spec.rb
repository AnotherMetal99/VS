require 'rails_helper'

RSpec.describe LabReport, type: :model do
  context 'validation lab_report test' do
    it 'ensured title presence' do
      lab_report = LabReport.new(title: 'good')
      expect(lab_report).to_not be_valid
    end
  end
  context 'validation lab_report test' do
    it 'ensured description presence' do
      lab_report = LabReport.new(description:'New labs')
      expect(lab_report).to_not be_valid
    end
  end
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
end
