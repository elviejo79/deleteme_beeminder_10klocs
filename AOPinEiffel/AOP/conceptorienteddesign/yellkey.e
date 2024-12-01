note
	purpose: "see description"
	description: "shorten URLs to common words"
    principle: "[
     after registering a URL u for t seconds
  	 and obtaining a shortening s, looking up s
  	 will yield u until the shortening expires
  	 t seconds from now:
  	 register (u, t, s); lookup (u, s') {s' = s}
    ]"

class
	YELLKEY
inherit
	HASH_TABLE[STRING, STRUCT[expires: INTEGER, original_url: STRING ]]

feature --principle
	principle_as_test {TEST}
			-- after registering a URL u for t seconds
	  	 	-- and obtaining a shortening s, looking up s
	  	 	-- will yield u until the shortening expires
	  		-- t seconds from now:
	  	 	-- register (u, t, s); lookup (u, s') {s' = s}
		local
			url:URL := "http://www.example.com"
			time_to_live:SECONDS := 10
		do

			short_url := register(url,time_to_live)
			check
				short_url_must_resolve_to_original_url: lookup(shortened) ~ url
				print("violates the invariant of a url shortening service")
			end

			--when the url_expires
			sleep(time_to_live+1)
			loookup(short_url)
			check
				expires_in_time: lookup(short_url) = Expired
			end
			ensure
				principle_is_part_of_the_class_not_instance: class
		end
	
feature --actions

	register(u:URL, t:SECONDS):URL
		require
			url_not_stored: not exists stored_url: item | stored_url.original = u
		do
			put(shortFor(u) ,[expiry, 	u])
		ensure
			url_retrivable: has(shortFor(u))
		end

	lookup(s:URL):URLorVoid
		require
			list_not_empty: list.count > 0
		do
			found := list.lookup(u)
			if attached found then
				if now < found.expiration then
					Result := found.original
				else
					Result := Void
				end
			end
		ensure else
			if_found_then_is_active: attached found implies now < found.expiration and Result.url = found.url
			-- How can I write that it was found but expired.
			if_not_found_then_empty: not(attached found) implies Result = void
		end

	prune_expired
		-- eliminate the stored links that have expired
		-- this is a system method, meaning it is called by the system
		-- not the user, every x minutes.
		do
			across items as shortUrl, url | if url.caducity < now then remove(shortUrl)
		end


feature -- convenience

	shortFor(u:URL):URL
	do
		Result := u
	end

	expiration_date(t:INTEGER):INTEGER
	do
		Result := now + t
	end


note
	author: "Alejandro Garcia by Translating David Jacksons article here: "
	date: "$Date$"
	revision: "$Revision$"
end
