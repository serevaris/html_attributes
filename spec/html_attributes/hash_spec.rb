require "spec_helper"

describe Hash do

  describe "#to_class_attr" do

    it "returns nil if hash is empty" do
      classes = {}
      expect(classes.to_class_attr).to be_nil
    end

    it "returns nil if hash only contains false values" do
      classes = { :foo => false, :bar => false }
      expect(classes.to_class_attr).to be_nil
    end

    it "returns space separated string" do
      classes = { :first => true, :second => true, :third => true }
      expect(classes.to_class_attr).to eql("first second third")
    end

    it "returns space separated string only for true values" do
      classes = { :first => true, :second => false, :third => true }
      expect(classes.to_class_attr).to eql("first third")
    end

  end

  describe "#to_style_attr" do

    it "returns nil if hash is empty" do
      styles = {}
      expect(styles.to_style_attr).to be_nil
    end

    it "returns nil if hash only contains nil values" do
      styles = { :display => nil }
      expect(styles.to_style_attr).to be_nil
    end

    it "returns semicolon separated string" do
      styles = { :display => "none", :visibility => "hidden" }
      expect(styles.to_style_attr).to eql("display: none; visibility: hidden;")
    end

    it "replaces '_' in keys with '-'" do
      styles = { :font_size => "12pt" }
      expect(styles.to_style_attr).to eql("font-size: 12pt;")
    end

    it "flattens hash to construct style statements" do
      styles = { :padding => { :top => "8px", :right => "15px" }, :font_size => "12pt" }
      expect(styles.to_style_attr).to eql("font-size: 12pt; padding-right: 15px; padding-top: 8px;")
    end

  end

  describe "#flatten" do

    it "does nothing for emtpy hash" do
      expect({}.flatten).to eql({})
    end

    it "does nothing for unnested hash" do
      expect({ "padding" => "8px", "font_size" => "12pt" }.flatten).to eql({ "padding" => "8px", "font_size" => "12pt" })
    end

    it "converts symbolized keys to stringified keys" do
      expect({ :padding => "8px", :font_size => "12pt" }.flatten).to eql({ "padding" => "8px", "font_size" => "12pt" })
    end

    it "flattens nested hash" do
      styles = { :padding => { :top => "8px", :right => "15px" } }
      expect(styles.flatten).to eql({ "paddingtop" => "8px", "paddingright" => "15px" })
    end

    it "flattens nested hash using given separator" do
      styles = { :padding => { :top => "8px", :right => "15px" } }
      expect(styles.flatten("-")).to eql({ "padding-top" => "8px", "padding-right" => "15px" })
    end

    it "passes array of nested keys if block is given" do
      styles = { :padding => { :top => "8px", :right => "15px" } }
      expect(styles.flatten { |keys| keys.join('-') }).to eql({ "padding-top" => "8px", "padding-right" => "15px" })
    end

  end

end
