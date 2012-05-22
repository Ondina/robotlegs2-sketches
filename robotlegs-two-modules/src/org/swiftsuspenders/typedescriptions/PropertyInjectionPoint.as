/*
 * Copyright (c) 2011 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file 
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.swiftsuspenders.typedescriptions
{
	import flash.utils.Dictionary;

	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.InjectorError;
	import org.swiftsuspenders.dependencyproviders.DependencyProvider;
	import org.swiftsuspenders.utils.SsInternal;

	public class PropertyInjectionPoint extends InjectionPoint
	{
		//----------------------       Private / Protected Properties       ----------------------//
		private var _propertyName : String;
		private var _mappingId : String;
		private var _optional : Boolean;


		//----------------------               Public Methods               ----------------------//
		public function PropertyInjectionPoint(mappingId : String, propertyName : String,
			optional : Boolean, injectParameters : Dictionary)
		{
			_propertyName = propertyName;
			_mappingId = mappingId;
			_optional = optional;
			this.injectParameters = injectParameters;
		}
		
		override public function applyInjection(
				target : Object, targetType : Class, injector : Injector) : void
		{
			var provider : DependencyProvider = injector.SsInternal::getProvider(_mappingId);
			if (!provider)
			{
				if (_optional)
				{
					return;
				}
				throw(new InjectorError(
						'Injector is missing a mapping to handle injection into property "' +
						_propertyName + '" of object "' + target + '" with type "' + targetType +
						'". Target dependency: "' + _mappingId + '"'));
			}
			target[_propertyName] = provider.apply(targetType, injector, injectParameters);
		}
	}
}