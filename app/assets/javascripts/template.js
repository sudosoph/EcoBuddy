  $(function() {

    Handlebars.registerHelper('niceDate', function(d) {
      return moment(d).calendar();
    });

    var showArticle = function(id) {
      $.ajax({
        url: '/api/articles/' + id,
        type: 'GET',
        data: 'json',
        success: function (data) {
          console.log(data);
          var source = $('#article-template').html();
          var template = Handlebars.compile(source);
          $('#output').html(template(data));
        }
      });
    };

    var showArticles = function() {
      $.ajax({
      url: '/api/articles',
      type: 'GET',
      data: 'json',
      success: function (data) {
          console.log('data', data);
          var source = $('#articles-template').html();
          console.log('source', source);
          var template = Handlebars.compile(source);
          console.log('template', template);
          var output = template(data);
          console.log('output', output);
          $('#output').html(output);
        }
      });
    };

    $('#output').on('click', 'ul.article-links li', function(e) {
      showArticle($(this).data('id'));
    });

    $('#output').on('click', 'p.articles-path', function(e) {
      showArticles();
    });

    showArticles();

  });