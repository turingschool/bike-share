require './spec/spec_helper'

feature 'when user visits conditions show page' do
    background do
        Condition.create!   
        

        visit '/conditions/1'
    end
