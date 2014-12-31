describe Hershey::FONTS do
  it "should have all the keys" do
    Hershey::FONTS.keys.sort.should == [:astrology, :cursive, :cyrillic,
      :futural, :futuram, :gothiceng, :gothicger, :gothicita, :greek,
      :japanese, :markers, :mathlow, :mathupp, :meteorology, :music, :scriptc,
      :scripts, :symbolic, :timesg, :timesi, :timesib, :timesr, :timesrb
    ]
  end
end