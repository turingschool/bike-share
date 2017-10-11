require './spec/spec_helper'

feature 'When a user visits new conditions page' do

    background { visit '/conditions/new' }

    it 'has status code 200' do
        expect(page.status_code).to eq(200)
    end

    it 'has a form' do
        expect(page).to have_css('form')
    end

    it 'they see a  field' do
        expect(page).to have_content(//i)
        expect(page).to have_field(''    
    end

    it 'they see a  field' do
        expect(page).to have_content(//i)
        expect(page).to have_field(''    
    end

    it 'they see a  field' do
        expect(page).to have_content(//i)
        expect(page).to have_field(''    
    end

    it 'they see a  field' do
        expect(page).to have_content(//i)
        expect(page).to have_field(''    
    end

    it 'they see a  field' do
        expect(page).to have_content(//i)
        expect(page).to have_field(''    
    end

    it 'they see a  field' do
        expect(page).to have_content(//i)
        expect(page).to have_field(''    
    end
end