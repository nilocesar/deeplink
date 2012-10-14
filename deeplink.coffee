class Deeplink
	
	@doc : undefined
	@deppInit : undefined
	constructor:(_name) ->
	init : ->
	  @doc = defineDocument()
	  root.Main.pageCurrent = root.Main.containersDeepLink[ getPageFunc() ] # Return o Deeplink inicial		
	  if( root.Main.pageCurrent != "home" and root.Main.pageCurrent != "" ) # chama as páginas internas
		  $( ".logoStrip" ).css "marginTop", -( 72 * 14 ) 
		  root.Main.nav.callNav  "page"

	  

	#--------------------------------------
	# PUBLIC FUNCTIONS
	#--------------------------------------
	getHash : ->
	  @getHashFunc()

	chageHash : (_page) ->
	  chageHashFunc _page


	#--------------------------------------
	# PRIVATE FUNCTIONS
	#--------------------------------------
	getPageFunc = ->
	  # Hash
	  hashTag = getHashFunc()
	  hashTag = hashTag.replace("#/", "")
	  hashTag = hashTag.replace("#!/", "")
	  hashTag = hashTag.replace("#!", "")
	  hashTag = hashTag.replace("/", "")
	  hashTag = hashTag.replace("/", "")
	  
	  # IE( ACERTA A CARACTERISTICA DO ARRAY )
	  unless Array.indexOf
	    Array::indexOf = (obj) ->
	      i = 0

	      while i < @length
	        return i  if this[i] is obj
	        i++
	      -1
	  
	  # Page
	  page = root.Main.containersDeepLink.indexOf( hashTag )
      
      #
	  if( page < 1 )
	    page = 1
		
	  page

	getHashFunc = ->
	  root.Main.deepLink.doc.location.hash

	chageHashFunc = (_page) ->
	  _hash = root.Main.containersDeepLink[ _page ]
	  _pageName = _hash.replace(/[\d\.]+/g, "")
	  _pageName = _hash
	  _hash = _pageName
	  
	  # Update Hash
	  root.Main.deepLink.doc.location.hash= "#!/" + _hash 

	defineDocument = ->
	  try
	    return (if top.document isnt `undefined` then top else window)
	  catch a
	    return window