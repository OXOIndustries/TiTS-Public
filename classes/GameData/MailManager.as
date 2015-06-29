package classes.GameData 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	/**
	 * ...
	 * @author Gedan
	 */
	public class MailManager 
	{
		/*
		ENTRIES = {
			"KeyName" : {
				"KeyReference" : KeyName,
				
				"UnlockedTimestamp" : undefined,
				"ViewedTimestamp" : undefined
				
				"Content" : null,
				"ContentCache" : null
				
				"Subject" : null,
				"SubjectCache" : null
				
				"From" : null,
				"FromCache" : null,
				
				"FromAddress" : null,
				"FromAddressCache" : null,
				
				"To" : null,
				"ToCache" : null,
				
				"ToAddress" : null,
				"ToAddressCache" : null,
				
				"Buttons" : null
			}
		}
		*/
		
		{
			MailManager.ENTRIES = new Object();
		}
		
		private static var ENTRIES:Object;
		
		/**
		 * Register a new entry in the list of entries.
		 * Each arg is stored according to its type; for message that involve ANY dynamic content, pass function references, otherwise pass
		 * raw strings.
		 * 
		 * When an entry is first unlocked, function references will be called and their resulting text will be cached (and persisted using saves).
		 * 
		 * @param	entryName	Key name for the entry, used to uniquely identify entries.
		 * @param	content		Mail body content
		 * @param	subject 	Mail subject display
		 * @param	from		Display name of sender
		 * @param	fromAddress	Address of sender
		 * @param 	to			Display name of recipient
		 * @param	toAddress	Address of recipient
		 */
		public static function addMailEntry(entryName:String, content:*, subject:*, from:*, fromAddress:*, to:*, toAddress:*, buttons:Array = null):void
		{
			var mObj:Object = {
				"KeyReference" : entryName,
				"UnlockedTimestamp" : undefined,
				"ViewedTimestamp" : undefined
			};
			
			mObj.Content = (content is Function ? content : null);
			mObj.ContentCache = (content is String ? content : null);
			
			mObj.Subject = (subject is Function ? subject : null);
			mObj.SubjectCache = (subject is String ? subject : null);
			
			mObj.From = (from is Function ? from : null);
			mObj.FromCache = (from is String ? from : null);
			
			mObj.FromAddress = (fromAddress is Function ? fromAddress : null);
			mObj.FromAddressCache = (fromAddress is String ? fromAddress : null);
			
			mObj.To = (to is Function ? to : null);
			mObj.ToCache = (to is String ? to : null);
			
			mObj.ToAddress = (toAddress is Function ? toAddress : null);
			mObj.ToAddressCache = (toAddress is String ? toAddress : null);
			
			if (buttons != null)
			{
				for (var i:int = 0; i < buttons.length; i++)
				{
					mObj.Buttons = [];
					
					var b:Object = buttons[i];
					
					if (b.DisplayName !== undefined && b.Functor !== undefined)
					{
						mObj.Buttons.push( { DisplayName: b.DisplayName, Functor: b.Functor } );
					}
					else
					{
						throw new Error("Malformed button option for mail entry!");
					}
				}
			}
			
			if (MailManager.ENTRIES[entryName] === undefined)
			{
				MailManager.ENTRIES[entryName] = mObj;
			}
			else
			{
				throw new Error("A mail entry with this key name already exists in the datastore.");
			}
		}
		
		public static function resetMails():void
		{
			// Reset entries back to a locked/unviewed state
			for (var bk:String in MailManager.ENTRIES)
			{
				var bo:Object = MailManager.ENTRIES[bk];
				
				bo.UnlockedTimestamp = undefined;
				bo.ViewedTimestamp = undefined;
				
				// If we have a function for a property, clear the cached results.
				if (bo.Content != null) bo.ContentCache = null;
				if (bo.Subject != null) bo.SubjectCache = null;
				if (bo.From != null) bo.FromCache = null;
				if (bo.FromAddress != null) bo.FromAddressCache = null;
				if (bo.To != null) bo.ToCache = null;
				if (bo.ToAddress != null) bo.ToAddressCache = null;
			}
		}
		
		/**
		 * Etract minimum data from the list of entries and return a dynamic object
		 * that can be stored in a SOL object.
		 * @return	Dynamic object representying {key:{unlocked, viewed}}
		 */
		public static function getSaveObject():Object
		{
			var d:Object = { };
			
			for (var k:String in MailManager.ENTRIES)
			{
				var bo:Object = MailManager.ENTRIES[k];
				
				if (bo.UnlockedTimestamp !== undefined)
				{
					d[k] = { };
					d[k].UnlockedTimestamp = bo.UnlockedTimestamp;
					
					// If we have a function for a property, ensure we persist cached data.
					if (bo.Content != null) d[k].ContentCache = bo.ContentCache;
					if (bo.Subject != null) d[k].SubjectCache = bo.SubjectCache;
					if (bo.From != null) d[k].FromCache = bo.FromCache;
					if (bo.FromAddress != null) d[k].FromAddressCache = bo.FromAddressCache;
					if (bo.To != null) d[k].ToCache = bo.ToCache;
					if (bo.ToAddress != null) d[k].ToAddressCache = bo.ToAddressCache;
				}
				if (MailManager.ENTRIES[k].ViewedTimestamp !== undefined)
				{
					d[k].ViewedTimestamp = MailManager.ENTRIES[k].ViewedTimestamp;
				}
			}
			
			return d;
		}
		
		/**
		 * Load a previously saved dynamic object of mail state.
		 * @param	d	Dynamic object representing {key:{unlocked, viewed}}
		 */
		public static function loadSaveObject(d:Object):void
		{
			MailManager.resetMails();
			
			// Then override each of them that we have from our save object.
			for (var k:String in d)
			{
				if (MailManager.ENTRIES[k] !== undefined)
				{
					var bo:Object = MailManager.ENTRIES[k];
					
					bo.UnlockedTimestamp = d[k].UnlockedTimestamp;
					bo.ViewedTimestamp = d[k].ViewedTimestamp;
					
					// If we stored any cache data, ensure we jam it into the entries list.
					if (d[k].ContentCache !== undefined) bo.ContentCache = d[k].ContentCache;
					if (d[k].SubjectCache !== undefined) bo.SubjectCache = d[k].SubjectCache;
					if (d[k].FromCache !== undefined) bo.FromCache = d[k].FromCache;
					if (d[k].FromAddressCache !== undefined) bo.FromAddressCache = d[k].FromAddressCache;
					if (d[k].ToCache !== undefined) bo.ToCache = d[k].ToCache;
					if (d[k].ToAddressCache !== undefined) bo.ToAddressCache = d[k].ToAddressCache;
				}
			}
		}
		
		public static function unlockEntry(entryName:String, timestamp:uint):void
		{
			if (MailManager.ENTRIES[entryName] === undefined)
			{
				throw new Error("Mail entry '" + entryName + "' was not found in the datastore.");
			}
			else
			{
				var bo:Object = MailManager.ENTRIES[entryName];
				bo.UnlockedTimestamp = timestamp;
				if (bo.Content != null) bo.ContentCache = bo.Content();
				if (bo.Subject != null) bo.SubjectCache = bo.Subject();
				if (bo.From != null) bo.FromCache = bo.From();
				if (bo.FromAddress != null) bo.FromAddressCache = bo.FromAddress();
				if (bo.To != null) bo.ToCache = bo.To();
				if (bo.ToAddress != null) bo.ToAddressCache = bo.ToAddress();
			}
		}
		
		public static function readEntry(entryName:String, timestamp:uint):void
		{
			if (MailManager.ENTRIES[entryName] === undefined)
			{
				throw new Error("Mail entry '" + entryName + "' was not found in the datastore.");
			}
			else
			{
				var bo:Object = MailManager.ENTRIES[entryName];
				if (bo.ViewedTimestamp == null || bo.ViewedTimestamp == undefined)
				{
					bo.ViewedTimestamp = timestamp;
				}
			}
		}
		
		public static function hasUnlockedEntries():Boolean
		{
			for (var k:String in MailManager.ENTRIES)
			{
				if (MailManager.ENTRIES[k].UnlockedTimestamp !== undefined) return true;
			}
			
			return false;
		}
		
		public static function isEntryUnlocked(entryName:String):Boolean
		{
			if (MailManager.ENTRIES[entryName] === undefined) throw new Error("Specified entry name '" + entryName + "' is not in the datastore.");
			
			if (MailManager.ENTRIES[entryName].UnlockedTimestamp !== undefined) return true;
			
			return false;
		}
		
		public static function getEntry(entryName:String):Object
		{
			if (MailManager.ENTRIES[entryName] === undefined) throw new Error("Specified entry name '" + entryName + "' was not found in the datastore.");
			
			return MailManager.ENTRIES[entryName];
		}
		
		public static function isEntryLocked(entryName:String):Boolean
		{
			return !MailManager.isEntryUnlocked(entryName);
		}
		
		public static function numUnlockedEntries():uint
		{
			var num:uint = 0;
			
			for (var k:String in MailManager.ENTRIES)
			{
				if (MailManager.ENTRIES[k].UnlockedTimestamp !== undefined) num++;
			}
			
			return num;
		}
		
		public static function hasUnreadEntries():Boolean
		{
			for (var k:String in MailManager.ENTRIES)
			{
				if (MailManager.ENTRIES[k].UnlockedTimestamp !== undefined && MailManager.ENTRIES[k].ViewedTimestamp === undefined) return true;
			}
			
			return false;
		}
		
		public static function numUnreadEntries():uint
		{
			var num:uint = 0;
			
			for (var k:String in MailManager.ENTRIES)
			{
				if (MailManager.ENTRIES[k].UnlockedTimestamp !== undefined && MailManager.ENTRIES[k].ViewedTimestamp === undefined) num++;
			}
			
			return num;
		}
		
		/**
		 * Present an array-contained list of entries, allowing the caller to handle whatever sorting they wish.
		 * We can sort this based on "date" of unlock, or view, and further filter it in-place to split things up.
		 * @return	Array of unlocked entries.
		 */
		public static function getUnlockedEntries():Array
		{
			var ret:Array = [];
			
			for (var k:String in MailManager.ENTRIES)
			{
				if (MailManager.ENTRIES[k].UnlockedTimestamp !== undefined)
				{
					ret.push(MailManager.ENTRIES[k]);
				}
			}
			
			return ret;
		}
	}

}