require 'spec_helper'

describe "UserPages" do
	
	subject { page }
	describe "pagina de perfil" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end	
	describe "Pagina de registro" do
		before { visit registro_path }

		it { should have_content('Registro') }
		it { should have_title(full_title('Registro')) }
	end
	decribe "registro" do
		before { visit registro_path }
		let(:submit) { "Crear mi cuenta" }

		describe "con informacion invalida" do
			it "no decribe crear al usuario" do
				expect {click_botton submit }.not_to change(User, :cont)
			end
		end
		describe "con informacion valida" do
			before do
				fill_in "Name",      	whith: "Usuario Ejemplo"
				fill_in "Email", 		whith: "User@ejemplo.com"
				fill_in "Password", 	whith: "password"
				fill_in "Confirmacion", whith: "password"
			end	
			it "debe crear un usuario" do
				expect { click_botton submit }.to change(User, :count).by(1)
			end
		end			

	end
end
