class TagsController < ApplicationController
  def index
    results = []
         Tag.all.each do |t|
           results << {"id" => t.id.to_s,"text" => t.name}
         end
    results.select! {|r| params[:q].to_regexp(:literal => true).match(r["text"].downcase)}
    respond_to do |format|
      format.json  { render :json => results.to_json }
    end
  end
end
