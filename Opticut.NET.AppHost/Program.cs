var builder = DistributedApplication.CreateBuilder(args);

builder.AddProject<Projects.Opticut_Web>("opticut-web");

builder.AddProject<Projects.Opticut_Services_GrpcHost>("opticut-services-grpchost");

builder.Build().Run();
