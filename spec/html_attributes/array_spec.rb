require "spec_helper"

describe Array do

  describe "#to_class_attr" do

    it "should return nil if array is empty" do
      classes = []
      classes.to_class_attr.should be_nil
    end

    it "should return a space separated string if array contains strings" do
      classes = ["first", "second", "third"]
      classes.to_class_attr.should eql("first second third")
    end

    it "should preserve existing spaces" do
      classes = ["first", "second third", "forth"]
      classes.to_class_attr.should eql("first second third forth")
    end

  end

  describe "#to_style_attr" do

    it "should return nil if array is empty" do
      styles = []
      styles.to_style_attr.should be_nil
    end

    it "should return a semicolon separated string if array contains strings" do
      styles = ["padding-top: 8px", "padding-right: 15px", "font-size: 12pt"]
      styles.to_style_attr.should eql("padding-top: 8px; padding-right: 15px; font-size: 12pt;")
    end

    it "should preserve existing semicolon" do
      styles = ["padding-top: 8px; padding-right: 15px", "font-size: 12pt"]
      styles.to_style_attr.should eql("padding-top: 8px; padding-right: 15px; font-size: 12pt;")
    end

  end

end
