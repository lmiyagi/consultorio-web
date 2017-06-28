class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :cpf, :phone, :cns, :default_password
  attribute :authentication_token, if: :show_token?

  def show_token?
    object.show_token
  end
end
