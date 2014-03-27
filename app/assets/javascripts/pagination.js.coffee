jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() + 10
        $('.pagination').text("Fetching more actors...")
        $.getScript(url)
    $(window).scroll()