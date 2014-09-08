//
//  ViewController.m
//  requisicao-ws
//
//  Created by Anderson Krüger on 08/09/14.
//  Copyright (c) 2014 MobilDev. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // AQUI EXEMPLO, retorno nos logs
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod: @"GET"];
    [request setURL: [NSURL URLWithString: [NSString stringWithFormat: @"http://api.randomuser.me/"]]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting HTTP status code %li", (long)[responseCode statusCode]);
    }
    
    NSError * erroConvert = [[NSError alloc]init];
    NSObject * retorno = [NSJSONSerialization JSONObjectWithData:oResponseData options: NSJSONReadingMutableContainers error: &erroConvert];
    
    
    // retorno é o dicionario de dados com os retornos, posicao results com o array de resultados
    NSLog(@" qtd: %i RETORNO: %@", (int) [[retorno copy] count],  [[retorno copy] objectForKey:@"results"]);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
