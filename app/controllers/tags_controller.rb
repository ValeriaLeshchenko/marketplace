class TagsController < ApplicationController
  def index
    results = []
         Tag.all.each do |t|
           results << {"id" => t.id.to_s,"text" => t.name, "total" => Tag.all.count.to_s}
         end
    results.select! {|r| params[:q].downcase.to_regexp(:literal => true).match(r["text"].downcase)}
    respond_to do |format|
      format.json  { render :json => Kaminari.paginate_array(results).page(params[:page]).per(10).to_json }
    end
  end
end