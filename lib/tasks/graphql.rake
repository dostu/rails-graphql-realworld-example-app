namespace :graphql do
  task schema: :environment do
    schema_defn = RealworldSchema.to_definition
    schema_path = 'app/graphql/schema.graphql'
    File.write(Rails.root.join(schema_path), schema_defn)
    puts "Updated #{schema_path}"
  end

  task docs: :environment do
    GraphQLDocs.build(
      filename: 'app/graphql/schema.graphql',
      output_dir: 'public/docs',
      base_url: 'docs'
    )
  end
end
