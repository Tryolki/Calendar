class HashTagPagesController < ApplicationController
  def show
    @comm = []
    @test = ''
    @foundhash = params[:id]
    @user = User.all
    @needHash = Tag.where(:name => @foundhash)
    @needHash.each do |x|
      unless @test.eql?(x.comment_id)
        @comm+=Comment.where(:id => x.comment_id)
      end
      @test = x.comment_id
    end
    end

end
