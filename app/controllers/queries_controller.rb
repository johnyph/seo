class QueriesController < ApplicationController

  def index
  	regexp = ""
  	@slashedKeywords = Keyword.joins(:results => :urls)
  										 .where("results.user_id = ?", current_user.id)
  										 .where("urls.link LIKE ?", '%/%/%')
  										 .order("keywords.name ASC")
  										 .group("keywords.id")
  										 .paginate(:page => params[:page])
  	@caretKeywords = Keyword.joins(:results => :urls)
  										 .where("results.user_id = ?", current_user.id)
  										 .where("urls.link LIKE ?", '%›%')
  										 .order("keywords.name ASC")
  										 .group("keywords.id")
  										 .paginate(:page => params[:page])
  end

  def inUrl

    @query = Url.search { 
    	fulltext params[:search]
    	with(:user_id, current_user.id)
    	paginate :page => params[:page] || 1, :per_page => 15
    }
    @results = @query.results
  end

  def linkInfo
  	@link = Url.find(params[:id])
  	

  	@occurrences = Url.where("link like ?", @link.link).length
  end

end
