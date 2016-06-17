//
//  Test.m
//  gpkg2
//
//  Created by Wes Richardet on 2/13/16.
//  Copyright © 2016 Boundless Spatial. All rights reserved.
//

#import "Test.h"
#import "sqlite3.h"
#import "gpkg.h"

@implementation Test

static int callback(void *data, int argc, char **argv, char **azColName){
  int i;
  fprintf(stderr, "%s: ", (const char*)data);
  for(i=0; i<argc; i++){
    printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
  }
  printf("\n");
  return 0;
}

- (void)doIt {
  NSString *filename =
  @"/Users/wesr/Development/boundless/BoundlessSync/haiti-vectors-split.gpkg";
  const char *path = [filename UTF8String];
  char *errMsg = nil;
  sqlite3 *database = nil;
  const char* data = "Callback function called";
  int err1 = sqlite3_open(path, &database);
  if (SQLITE_OK == err1) {
    NSLog(@"LOOK AT ME 0 = %d", err1);
  }
  sqlite3_enable_load_extension(database, 1);
  sqlite3_gpkg_init(database, NULL, NULL);
  NSString *sql = @"SELECT ST_Centroid(the_geom) FROM polygon_features LIMIT 1";
  int rc;
  char *errmsg = nil;
  rc = sqlite3_exec(database, [sql UTF8String], callback, data, &errmsg);
  if( rc != SQLITE_OK ){
    fprintf(stderr, "SQL error: %s\n", errmsg);
    sqlite3_free(errmsg);
  }else{
    fprintf(stdout, "Operation done successfully\n");
  }
  sqlite3_close(database);

}

@end
