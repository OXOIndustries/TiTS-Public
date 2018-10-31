package classes.Ships 
{
	/**
	 * IOwned and IOwner are a paired set of interfaces to deal with parent->child object relationships.
	 * If an object implements IOwner, then any children serialized under it that implement IOwned will have their `Owner` property set during deserialization to the object that contains them.
	 * Owner isn't set during construction, it is a standalone property. Ergo, we still have basic constructors for all Ownable objects (no-arg construction), they can operate as though they do not
	 * have owners (eg Items that have yet to be looted) but this does require all code within a potential child object to handle the fact that Owner may be null.
	 * @author Gedan
	 */
	public interface IOwner 
	{
		
	}

}