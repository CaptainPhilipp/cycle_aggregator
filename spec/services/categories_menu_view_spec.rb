require 'rails_helper'

RSpec.describe 'CategoriesMenuView' do
  include_context 'seed categories'

  let(:view) { CategoriesMenuView.new Category.all, groups: SportGroup.all }

  describe '#groups' do
    it 'shows only groups' do
      expect(view.groups.all? { |g| g.is_a? SportGroup }).to be true
    end

    it 'shows all groups' do
      expect(view.groups).to match_array SportGroup.all
    end
  end

  describe '#sections_for(parents)' do
    it 'shows right sections of group' do
      expect(view.sections_for(group_mtb)).to match_array group_mtb_sections
      expect(view.sections_for(group_road)).to match_array group_road_sections
    end
  end

  describe '#subsections_for(parents)' do
    it 'shows all subsections of parents' do
      expect(view.subsections_for(group_mtb, section_frameset))
        .to match_array subsections_of_mtb_framesets
    end

    it 'shows only right subsections of parents' do
      expect(view.subsections_for(group_road, section_frameset))
        .to match_array subsections_of_road_framesets
    end
  end
end