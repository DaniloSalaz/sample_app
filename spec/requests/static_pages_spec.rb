require 'spec_helper'

describe "StaticPages" do
  subject { page }
  describe "Pagina de Inicio" do
    before { visit root_path }
    it { should have_content('Sample app')}
    it { should_not have_title('Sample_app / Pagina Inicial')}
   end
  describe "Pagina de ayuda 'Ayuda'" do 
  	before { visit ayuda_path }
    it { should have_content('Ayuda')}
    it { should have_title('Sample_app / ayuda')}
    
  end
  describe "Pagina Acerca de" do
    before { visit acerca_de_path }
    it { should have_content('Acerca de')}
    it { should have_title('Sample_app / acerca de')}
    
end
end
