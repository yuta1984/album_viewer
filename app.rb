# ライブラリのロード
require 'sequel'
require 'sinatra'
# DBへの接続
db_path = File.dirname(__FILE__) + "/chinook.db"
DB = Sequel.sqlite(db_path)

# ルーティング: アーティスト一覧画面
get '/' do
  @artists = DB[:Artists]
  erb :index
end

# ルーティング: アルバム一覧画面
get '/albums/:artist_id' do
  artist_id = params[:artist_id]
  @artist = DB[:Artists].where(ArtistId: artist_id).first
  @albums = DB[:Albums].where(ArtistId: artist_id).all
  erb :albums
end
