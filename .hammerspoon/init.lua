watcher = hs.caffeinate.watcher.new(function (e)
  if (e == 0) or (e == 4) or (e == 11) then
    hs.application.launchOrFocus('MiddleClick')
  end
  hs.alert.show(e)
end);

watcher:start()
