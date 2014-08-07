require 'spec_helper'

describe Post do
  before do
    @post = Post.new(title: "Example Post", text: "Sample text")
  end

  subject {@post}
  it { should respond_to(:title) }
  it { should respond_to(:text) }
  it { should be_valid }


  describe "when title is not present" do
    before {@post.title = " "}
    it { should_not be_valid }
  end

  describe "when text is not present" do
    before { @post.title = " "}
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @post.title = "A" * 141 }
    it { should_not be_valid }

  end

  describe "when title is not uniq" do
    before { @wrong_post = Post.new(title: "Example Post", text: "Night. Sun.")
     @wrong_post.save}
   
    it { should_not be_valid }
  end
end
