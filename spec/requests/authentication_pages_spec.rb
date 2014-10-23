require 'spec_helper'

describe "AuthenticationPages" do
  
  subject { Authentication } 
  		
  		describe "paginas de ingreso" do

  			before { visit ingreso_path }
  			it { should have_content ('Ingreso') }
  			it { should have_title('Ingreso') }
  		
  		end
 
 describe"ingreso" do 
	before { visit ingreso_path}
 		describe "con informacion invalida" do
 		before {click_button "Ingreso" } 

 		it { should have_title('Ingreso') }	
 		it { should have_selector('div.alert.alert-error') }
 	end
 	describe" con informacion valida" do
 		let(:user) { FactoryGirl.create(:user) }
 		before do
 			fill_in "Email", 		with: user.email.upcase
 			fill_in "Password",		with: user.password
 			click_button "Ingreso"
 		end
 		it { should have_title(user.name) }
 		it { should have_link('Perfil', href: user_path(user)) }
 		it { should have_link('Salida'), herf: salida_path }
 		it { should_not have_link('Ingreso', herf: ingreso_path )}
 	end
 	end		
end
