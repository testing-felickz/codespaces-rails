#http://localhost:3000/my_controller?type=draft
class MyController < ApplicationController
    MY_INDEX_TYPES = %w(draft scheduled published)
  
    def index

      @type = MY_INDEX_TYPES.include?(params[:type]) ? params[:type] : 'draft'
  
      @records = MyRecord.public_send(@type).descend_by_published_at
      @featured_records = MyRecord.featured
  
      @records = @records.paginate(page: params[:page], per_page: 20)
  
      respond_to do |format|
        format.html
        format.rss { render xml: rss_doc_for(@records).to_xml }
      end
    end
  end