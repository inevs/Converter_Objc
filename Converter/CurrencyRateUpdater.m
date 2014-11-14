#import "CurrencyRateUpdater.h"

static NSString *const ApiKey = @"9414e06390f044fd56d5c8bf2ed0c4104d204ce7";
static NSString *const BaseCurrency = @"EUR";

@implementation CurrencyRateUpdater

- (void)updateConversionRateForCurrencyFromEuroTo:(NSString *)isoCode {
	dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
	    NSString *conversion = [self retrieveConversionFrom:BaseCurrency to:isoCode];
		NSError *error;
		NSNumber *rate = [self parse:conversion error:&error];
		dispatch_async(dispatch_get_main_queue(), ^{
			if (rate) {
				[self.delegate currencyRateUpdater:self didUpdateRate:rate forCurrency:isoCode];
			} else {
				NSLog(@"error = %@", error);
			}
		});
	});
}

- (NSNumber *)parse:(NSString *)json error:(NSError **)error {
	NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
	NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
	if (dict) {
		NSNumber *rate = dict[@"rate"];
		return rate;
	}
	return nil;
}

- (NSString *)retrieveConversionFrom:(NSString *)from to:(NSString *)to {
	NSError *error;
	NSString *apiString = [NSString stringWithFormat:@"http://currency-api.appspot.com/api/%@/%@.json?key=%@", from, to, ApiKey];
	NSURL *url = [NSURL URLWithString:apiString];
	NSString *json = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
	return json;
}


@end
