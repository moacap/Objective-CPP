#import <Foundation/Foundation.h>
#import "NSString+ObjectiveCPP.h"

static NSStringEncoding __defaultCPPStringEncoding = NSUTF8StringEncoding;

@implementation NSString( ObjectiveCPP )

+ ( NSStringEncoding )defaultCPPStringEncoding
{
    @synchronized( self )
    {
        return __defaultCPPStringEncoding;
    }
}

+ ( void )setDefaultCPPStringEncoding: ( NSStringEncoding )encoding
{
    @synchronized( self )
    {
        __defaultCPPStringEncoding = encoding;
    }
}

+ ( id )stringWithCPPString: ( std::string & )cppString encoding: ( NSStringEncoding )enc
{
    return [ NSString stringWithCString: cppString.c_str() encoding: enc ];
}

+ ( std::string )cppStringWithContentsOfFile: ( NSString * )path encoding: ( NSStringEncoding )enc error: ( NSError ** )error
{
    return std::string( [ [ NSString stringWithContentsOfFile: path encoding: enc error: error ] cppStringUsingEncoding: enc ] );
}

+ ( std::string )cppStringWithContentsOfFile: ( NSString * )path usedEncoding: ( NSStringEncoding * )enc error: ( NSError ** )error
{
    return std::string( [ [ NSString stringWithContentsOfFile: path usedEncoding: enc error: error ] cppStringUsingEncoding: *( enc ) ] );
}

+ ( std::string )cppStringWithContentsOfURL: ( NSURL * )url encoding: ( NSStringEncoding )enc error: ( NSError ** )error
{
    return std::string( [ [ NSString stringWithContentsOfURL: url encoding: enc error: error ] cppStringUsingEncoding: enc ] );
}

+ ( std::string )cppStringWithContentsOfURL: ( NSURL * )url usedEncoding: ( NSStringEncoding * )enc error: ( NSError ** )error
{
    return std::string( [ [ NSString stringWithContentsOfURL: url usedEncoding: enc error: error ] cppStringUsingEncoding: *( enc ) ] );
}

- ( id )initWithCPPString: ( std::string & )cppString encoding: ( NSStringEncoding )encoding
{
    return [ self initWithCString: cppString.c_str()  encoding: encoding ];
}

- ( std::string )cppStringUsingEncoding: ( NSStringEncoding )encoding
{
    return std::string( [ self cStringUsingEncoding: encoding ] );
}

- ( std::string )cppStringByAppendingString: ( NSString * )aString
{
    return std::string( [ [ self stringByAppendingString: aString ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( NSString * )stringByAppendingCPPString: ( std::string & )aString
{
    return [ self stringByAppendingString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByPaddingToLength: ( NSUInteger )newLength withString: ( NSString * )padString startingAtIndex: ( NSUInteger )padIndex
{
    return std::string( [ [ self stringByPaddingToLength: newLength withString: padString startingAtIndex:padIndex ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( NSString * )stringByPaddingToLength: ( NSUInteger )newLength withCPPString: ( std::string & )padString startingAtIndex: ( NSUInteger )padIndex
{
    return [ self stringByPaddingToLength: newLength withString: [ NSString stringWithCPPString: padString encoding: [ NSString defaultCPPStringEncoding ] ] startingAtIndex: padIndex ];
}

- ( NSArray * )componentsSeparatedByCPPString: ( std::string & )separator
{
    return [ self componentsSeparatedByString: [ NSString stringWithCPPString: separator encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByTrimmingCharactersInSet: ( NSCharacterSet * )set
{
    return std::string( [ [ self stringByTrimmingCharactersInSet: set ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppSubstringFromIndex: ( NSUInteger )anIndex
{
    return std::string( [ [ self substringFromIndex: anIndex ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppSubstringWithRange: ( NSRange )aRange
{
    return std::string( [ [ self substringWithRange: aRange ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppSubstringToIndex: ( NSUInteger )anIndex
{
    return std::string( [ [ self substringToIndex: anIndex ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( NSRange )rangeOfCPPString: ( std::string & )aString
{
    return [ self rangeOfString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSRange )rangeOfCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask
{
    return [ self rangeOfString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask ];
}

- ( NSRange )rangeOfCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )aRange
{
    return [ self rangeOfString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask range: aRange ];
}

- ( NSRange )rangeOfCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )searchRange locale: ( NSLocale * )locale
{
    return [ self rangeOfString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask range: searchRange locale: locale ];
}

- ( std::string )cppStringByReplacingOccurrencesOfString: ( NSString * )target withString: ( NSString * )replacement
{
    return std::string( [ [ self stringByReplacingOccurrencesOfString: target withString: replacement ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppStringByReplacingOccurrencesOfString: ( NSString * )target withString: ( NSString * )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange
{
    return std::string( [ [ self stringByReplacingOccurrencesOfString: target withString: replacement options: options range: searchRange ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}
- ( NSString * )stringByReplacingOccurrencesOfString: ( NSString * )target withCPPString: ( std::string & )replacement
{
    return [ self stringByReplacingOccurrencesOfString: target withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSString * )stringByReplacingOccurrencesOfString: ( NSString * )target withCPPString: ( std::string & )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange
{
    return [ self stringByReplacingOccurrencesOfString: target withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] options: options range: searchRange ];
}

- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( std::string & )target withString: ( NSString * )replacement
{
    return [ self stringByReplacingOccurrencesOfString: [ NSString stringWithCPPString: target encoding: [ NSString defaultCPPStringEncoding ] ] withString: replacement ];
}

- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( std::string & )target withString: ( NSString * )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange
{
    return [ self stringByReplacingOccurrencesOfString: [ NSString stringWithCPPString: target encoding: [ NSString defaultCPPStringEncoding ] ] withString: replacement options: options range: searchRange ];
}

- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( std::string & )target withCPPString: ( std::string & )replacement
{
    return [ self stringByReplacingOccurrencesOfString: [ NSString stringWithCPPString: target encoding: [ NSString defaultCPPStringEncoding ] ] withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( std::string & )target withCPPString: ( std::string & )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange
{
    return [ self stringByReplacingOccurrencesOfString: [ NSString stringWithCPPString: target encoding: [ NSString defaultCPPStringEncoding ] ] withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] options: options range: searchRange ];
}

- ( std::string )cppStringByReplacingCharactersInRange: ( NSRange )range withString: ( NSString * )replacement
{
    return std::string( [ [ self stringByReplacingCharactersInRange: range withString: replacement ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( NSString * )stringByReplacingCharactersInRange: ( NSRange )range withCPPString: ( std::string & )replacement
{
    return [ self stringByReplacingCharactersInRange: range withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )caseInsensitiveCompareWithCPPString: ( std::string & )aString
{
    return [ self caseInsensitiveCompare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )localizedCaseInsensitiveCompareWithCPPString: ( std::string & )aString
{
    return [ self localizedCaseInsensitiveCompare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )compareWithCPPString: ( std::string & )aString
{
    return [ self compare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )localizedCompareWithCPPString: ( std::string & )aString
{
    return [ self localizedCompare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )compareWithCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask
{
    return [ self compare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask ];
}

- ( NSComparisonResult )compareWithCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )range
{
    return [ self compare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask range: range ];
}

- ( NSComparisonResult )compareWithCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )range locale: ( id )locale
{
    return [ self compare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask range: range locale: locale ];
}

- ( NSComparisonResult )localizedStandardCompareWithCPPString: ( std::string & )string
{
    return [ self localizedStandardCompare: [ NSString stringWithCPPString: string encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( BOOL )hasCPPStringPrefix: ( std::string & )aString
{
    return [ self hasPrefix: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( BOOL )hasCPPStringSuffix: ( std::string & )aString
{
    return [ self hasSuffix: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( BOOL )isEqualToCPPString: ( std::string & )aString
{
    return [ self isEqualToString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByFoldingWithOptions: ( NSStringCompareOptions )options locale: ( NSLocale * )locale
{
    return std::string( [ [ self stringByFoldingWithOptions: options locale: locale ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( NSString * )commonPrefixWithCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask
{
    return [ self commonPrefixWithString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask ];
}

- ( std::string )commonCPPPrefixWithString: ( NSString * )aString options: ( NSStringCompareOptions )mask
{
    return std::string( [ [ self commonPrefixWithString: aString options: mask ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )capitalizedCPPString
{
    return std::string( [ [ self capitalizedString ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )lowercaseCPPString
{
    return std::string( [ [ self lowercaseString ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )uppercaseCPPString
{
    return std::string( [ [ self uppercaseString ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )decomposedCPPStringWithCanonicalMapping
{
    return std::string( [ [ self decomposedStringWithCanonicalMapping ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )decomposedCPPStringWithCompatibilityMapping
{
    return std::string( [ [ self decomposedStringWithCompatibilityMapping ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )precomposedCPPStringWithCanonicalMapping
{
    return std::string( [ [ self precomposedStringWithCanonicalMapping ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )precomposedCPPStringWithCompatibilityMapping
{
    return std::string( [ [ self precomposedStringWithCompatibilityMapping ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )lastPathComponentAsCPPString
{
    return std::string( [ [ self lastPathComponent ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )pathExtensionAsCPPString
{
    return std::string( [ [ self pathExtension ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppStringByAbbreviatingWithTildeInPath
{
    return std::string( [ [ self stringByAbbreviatingWithTildeInPath ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppStringByAppendingPathComponent: ( NSString * )aString
{
    return std::string( [ [ self stringByAppendingPathComponent: aString ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( NSString * )cppStringByAppendingCPPPathComponent: ( std::string & )aString
{
    return [ self stringByAppendingPathComponent: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByAppendingPathExtension: ( NSString * )ext
{
    return std::string( [ [ self stringByAppendingPathExtension: ext ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( NSString * )stringByAppendingCPPPathExtension: ( std::string & )ext
{
    return [ self stringByAppendingPathExtension: [ NSString stringWithCPPString: ext encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByDeletingLastPathComponent
{
    return std::string( [ [ self stringByDeletingLastPathComponent ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppStringByDeletingPathExtension
{
    return std::string( [ [ self stringByDeletingPathExtension ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppStringByExpandingTildeInPath
{
    return std::string( [ [ self stringByExpandingTildeInPath ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppStringByResolvingSymlinksInPath
{
    return std::string( [ [ self stringByResolvingSymlinksInPath ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppStringByStandardizingPath
{
    return std::string( [ [ self stringByStandardizingPath ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppStringByAddingPercentEscapesUsingEncoding: ( NSStringEncoding )encoding
{
    return std::string( [ [ self stringByAddingPercentEscapesUsingEncoding: encoding ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

- ( std::string )cppStringByReplacingPercentEscapesUsingEncoding: ( NSStringEncoding )encoding
{
    return std::string( [ [ self stringByReplacingPercentEscapesUsingEncoding: encoding ] cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ] );
}

@end
