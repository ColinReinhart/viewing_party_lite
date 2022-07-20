# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  it 'Has title of application' do
    visit root_path

    expect(page).to have_content('Viewing Party')
  end

  it 'Has button to create new user' do
    visit root_path

    expect(page).to have_link('Create user')
  end

  it 'Has link to landing page' do
    visit root_path

    expect(page).to have_link('Home')
  end
end
