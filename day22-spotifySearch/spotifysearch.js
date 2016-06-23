
function getArtists () {
    var url = 'https://api.spotify.com/v1/search?type=artist&query=';
    var urlsearch = url + $("#name").val(); 
    var request = $.get(urlsearch);
     
    function showArtist (responseAPI) {
        var artists = responseAPI["artists"]["items"];

        console.log(artists);
      
        artists.forEach(function appendLi (artist) {

          var html = [
              '<h4>' + artist["name"] + '</h4>',
              '<dl>',
                poster(artist),
              '</dl>'
          ].join('\n');

          function poster (artist){
            if (artist["images"].length != 0){
               return '<dt>Poster:</dt><dd><img id=' + artist["id"] + ' class="poster" src=' + artist["images"][0]["url"] + ' onclick="getSongs(id)"/></dd>'
            };
          };

          var newLi = document.createElement('li');
          newLi.innerHTML = html;
          document.querySelector('.js-artist_list').appendChild(newLi);
        });
             
    }

    function handleError (err1, err2, err3) {
      console.error('OH NO!!', err1, err2, err3);
    }

    request.done(showArtist);
    request.fail(handleError);
      
}

$('.js-artists').on('click', getArtists);

function getSongs(id){

console.log("My id is: "+id);

  var url = 'https://api.spotify.com/v1/artists/';
  var urlsearch = url + id + "/top-tracks?country=SE";
  console.log(urlsearch);
  var request = $.get(urlsearch);

  function showTracks (responseAPI) {
        var tracks = responseAPI["tracks"];
        console.log(tracks);
         
        tracks.forEach(function appendLi (track) {

          var html = [
              '<h4>' + 'Tracks' + '</h4>',
              '<dl>',
              '<dt>Track:</dt>',
              '<dd>' + track["name"] + '</dd> ',
              '</dl>'
          ].join('\n');

          var otherLi = document.createElement('li');
          otherLi.innerHTML = html;
          document.querySelector('.js-track_list').appendChild(otherLi);
        });
             
    }

    function handleError (err1, err2, err3) {
      console.error('OH NO!!', err1, err2, err3);
    }

    request.done(showTracks);
    request.fail(handleError);
 
};

