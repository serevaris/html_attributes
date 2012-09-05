require "spec_helper"

describe Hash do

  describe "#to_class_attr" do

    it "should return nil if hash is empty" do
      classes = {}
      classes.to_class_attr.should be_nil
    end

    it "should return nil if hash only contains false values" do
      classes = { :foo => false, :bar => false }
      classes.to_class_attr.should be_nil
    end

    it "should return space separated string" do
      classes = { :first => true, :second => true, :third => true }
      classes.to_class_attr.should eql("first second third")
    end

    it "should return space separated string only for true values" do
      classes = { :first => true, :second => false, :third => true }
      classes.to_class_attr.should eql("first third")
    end

  end

  describe "#to_style_attr" do

    it "should return nil if hash is empty" do
      styles = {}
      styles.to_style_attr.should be_nil
    end

    it "should return nil if hash only contains nil values" do
      styles = { :display => nil }
      styles.to_style_attr.should be_nil
    end

    it "should return semicolon separated string" do
      styles = { :display => "none", :visibility => "hidden" }
      styles.to_style_attr.should eql("display: none; visibility: hidden;")
    end

    it "should replace '_' in keys with '-'" do
      styles = { :font_size => "12pt" }
      styles.to_style_attr.should eql("font-size: 12pt;")
    end

    it "should flatten hash to construct style statements" do
      styles = { :padding => { :top => "8px", :right => "15px" }, :font_size => "12pt" }
      styles.to_style_attr.should eql("font-size: 12pt; padding-right: 15px; padding-top: 8px;")
    end

  end

  describe "#flatten" do

    it "should do nothing for emtpy hash" do
      {}.flatten.should eql({})
    end

    it "should do nothing for unnested hash" do
      { "padding" => "8px", "font_size" => "12pt" }.flatten.should eql({ "padding" => "8px", "font_size" => "12pt" })
    end

    it "should convert symbolized keys to stringified keys" do
      { :padding => "8px", :font_size => "12pt" }.flatten.should eql({ "padding" => "8px", "font_size" => "12pt" })
    end

    it "should flatten nested hash" do
      styles = { :padding => { :top => "8px", :right => "15px" } }
      styles.flatten.should eql({ "paddingtop" => "8px", "paddingright" => "15px" })
    end

    it "should flatten nested hash using given separator" do
      styles = { :padding => { :top => "8px", :right => "15px" } }
      styles.flatten("-").should eql({ "padding-top" => "8px", "padding-right" => "15px" })
    end

    it "should pass array of nested keys if block is given" do
      styles = { :padding => { :top => "8px", :right => "15px" } }
      styles.flatten { |keys| keys.join('-') }.should eql({ "padding-top" => "8px", "padding-right" => "15px" })
    end

  end

end
