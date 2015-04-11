class PagesController < ApplicationController
  def dashboard
  end

  def upload
    require 'csv' # csv Library
    myfile = params[:file]

    begin
      csv = CSV.read(myfile.path)
    rescue Exception=>e
     flash.now[:error]="error:#{e}"
     raise
    end

    if csv.length > 1
      redirect_to root_path, :flash => { :error => " CSV Should be one line file" }
    end

    if (csv[0].length < 1) || (csv[0].length > 1000)
      redirect_to root_path, :flash => { :error => "The CSV file could contain between 1 and 1000 keywords" }
    end

    csv = csv[0]
    
    report = Report.new
    report.user = current_user
  
    csv.each do |el|

      page = Page.new(el)

      Keyword.create!({name: el}) unless (Keyword.exists?(name: el))
      keyword = Keyword.where("name LIKE ?", el).first


      result = Result.new({
        ad_top: page.top_ads.length,
        ad_right: page.right_ads.length,
        ad_total: page.top_ads.length + page.right_ads.length,
        simple_results: page.normal_results_length,
        total_links: page.normal_results_length + page.top_ads.length + page.right_ads.length,
        total_search: page.top_stats,
        code: ActionController::Base.helpers.sanitize(page.page_html),
      })

      result.keyword = keyword
      result.user = current_user
      result.report = report

      page.top_ads_links.each do |link|
        url = Url.new({link: link, url_type_id: 1, user_id: current_user.id})
        url.save
        result.urls << url
      end

      page.right_ads_links.each do |link|
        url = Url.new({link: link, url_type_id: 2, user_id: current_user.id})
        url.save
        result.urls << url
      end

      page.normal_results_links.each do |link|
        url = Url.new({link: link, url_type_id: 3, user_id: current_user.id})
        url.save
        result.urls << url
      end

      result.save
      report.results << result
    end
    report.save
    redirect_to report_path(report.id), :flash => { :success => "Report was created !!!" }
  end
end
