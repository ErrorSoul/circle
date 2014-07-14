require 'spec_helper'

describe User do
  before {@user = User.new(name:"Arnold", email: "arni@mail.ru")}
  subject {@user}
  it {should respond_to(:name)}
  it {should respond_to(:email)}
end


