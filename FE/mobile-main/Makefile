clean:
	flutter clean

get-dependencies:
	flutter pub get

upgrade-dependencies:
	flutter pub upgrade --major-versions

build-runner:
	flutter pub run build_runner build

watch-runner:
	flutter pub run build_runner watch

build-runner-delete:
	flutter pub run build_runner build --delete-conflicting-outputs

watch-runner-delete:
	flutter pub run build_runner watch --delete-conflicting-outputs

gen-l10n:
	flutter gen-l10n

gen-flavor:
	flutter pub run flutter_flavorizr

build-apk-dev:
	flutter build apk --flavor dev -t lib/main_dev.dart

gen-assets:
	fluttergen -c pubspec.yaml

reset:
	flutter clean
	flutter pub get
	flutter gen-l10n
	flutter pub run build_runner build --delete-conflicting-outputs

# Create a new feature structure
# Usage:
# 1. make create-feature (will prompt for feature name)
# 2. make create-feature name=feature_name
create-feature:
	@if [ -z "$(name)" ]; then \
		read -p "Enter feature name: " entered_name; \
		name=$$entered_name; \
	fi; \
	if [ -z "$$name" ]; then \
		echo "Error: feature name is required"; \
		exit 1; \
	fi; \
	if ! echo "$$name" | grep -q '^[a-z][a-z0-9_]*$$'; then \
		echo "Error: Invalid feature name. Feature name must:"; \
		echo "  - Start with a lowercase letter"; \
		echo "  - Contain only lowercase letters, numbers, and underscores"; \
		echo "  - Example valid names: user, user_profile, auth2, todo_list"; \
		exit 1; \
	fi; \
	feature_path="lib/features/$$name"; \
	if [ -d "$$feature_path" ]; then \
		echo "Warning: Feature directory already exists"; \
		read -p "Do you want to overwrite? (y/n): " confirm; \
		if [ "$$confirm" != "y" ]; then \
			echo "Operation cancelled"; \
			exit 1; \
		fi; \
		rm -rf "$$feature_path"; \
	fi; \
	capitalized_name=$$(echo "$$name" | perl -pe 's/(\w+)/\u$$1/'); \
	echo "Creating feature structure for $$name..."; \
	if ! mkdir -p "$$feature_path/data/datasources" 2>/dev/null || \
	   ! mkdir -p "$$feature_path/data/models" 2>/dev/null || \
	   ! mkdir -p "$$feature_path/data/repositories" 2>/dev/null || \
	   ! mkdir -p "$$feature_path/domain/entities" 2>/dev/null || \
	   ! mkdir -p "$$feature_path/domain/repositories" 2>/dev/null || \
	   ! mkdir -p "$$feature_path/domain/usecases" 2>/dev/null || \
	   ! mkdir -p "$$feature_path/page" 2>/dev/null; then \
		echo "Error: Failed to create directory structure. Check permissions and path."; \
		rm -rf "$$feature_path"; \
		exit 1; \
	fi; \
	echo "// export remote_datasource.dart" > "$$feature_path/data/datasources/datasources.dart" && \
	echo "export '$${name}_remote_datasource.dart';" >> "$$feature_path/data/datasources/datasources.dart" && \
	echo "import 'package:flutter_auth_app/core/core.dart';" > "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "" >> "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "abstract class $${capitalized_name}RemoteDataSource {}" >> "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "" >> "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "class $${capitalized_name}RemoteDataSourceImpl implements $${capitalized_name}RemoteDataSource {" >> "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "  final DioClient _client;" >> "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "" >> "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "  $${capitalized_name}RemoteDataSourceImpl(this._client);" >> "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "" >> "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "}" >> "$$feature_path/data/datasources/$${name}_remote_datasource.dart" && \
	echo "// export models" > "$$feature_path/data/models/models.dart" && \
	echo "// export repositories" > "$$feature_path/data/repositories/repositories.dart" && \
	echo "export '$${name}_repository_impl.dart';" >> "$$feature_path/data/repositories/repositories.dart" && \
	echo "import 'package:dartz/dartz.dart';" > "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "import 'package:flutter_auth_app/core/core.dart';" >> "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "import 'package:flutter_auth_app/features/$${name}/$${name}.dart';" >> "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "" >> "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "class $${capitalized_name}RepositoryImpl implements $${capitalized_name}Repository {" >> "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "  /// Data Source" >> "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "  final $${capitalized_name}RemoteDataSource $${name}RemoteDataSource;" >> "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "" >> "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "  const $${capitalized_name}RepositoryImpl(this.$${name}RemoteDataSource);" >> "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "}" >> "$$feature_path/data/repositories/$${name}_repository_impl.dart" && \
	echo "export 'datasources/datasources.dart';" > "$$feature_path/data/data.dart" && \
	echo "export 'models/models.dart';" >> "$$feature_path/data/data.dart" && \
	echo "export 'repositories/repositories.dart';" >> "$$feature_path/data/data.dart" && \
	echo "// export entities" > "$$feature_path/domain/entities/entities.dart" && \
	echo "// export repositories" > "$$feature_path/domain/repositories/repositories.dart" && \
	echo "export '$${name}_repository.dart';" >> "$$feature_path/domain/repositories/repositories.dart" && \
	echo "abstract class $${capitalized_name}Repository {}" > "$$feature_path/domain/repositories/$${name}_repository.dart" && \
	echo "// export usecases" > "$$feature_path/domain/usecases/usecases.dart" && \
	echo "export 'entities/entities.dart';" > "$$feature_path/domain/domain.dart" && \
	echo "export 'repositories/repositories.dart';" >> "$$feature_path/domain/domain.dart" && \
	echo "export 'usecases/usecases.dart';" >> "$$feature_path/domain/domain.dart" && \
	echo "import 'package:flutter/material.dart';" > "$$feature_path/page/$${name}_page.dart" && \
	echo "" >> "$$feature_path/page/$${name}_page.dart" && \
	echo "class $${capitalized_name}Page extends StatelessWidget {" >> "$$feature_path/page/$${name}_page.dart" && \
	echo "  const $${capitalized_name}Page({super.key});" >> "$$feature_path/page/$${name}_page.dart" && \
	echo "" >> "$$feature_path/page/$${name}_page.dart" && \
	echo "  @override" >> "$$feature_path/page/$${name}_page.dart" && \
	echo "  Widget build(BuildContext context) {" >> "$$feature_path/page/$${name}_page.dart" && \
	echo "    return const Placeholder();" >> "$$feature_path/page/$${name}_page.dart" && \
	echo "  }" >> "$$feature_path/page/$${name}_page.dart" && \
	echo "}" >> "$$feature_path/page/$${name}_page.dart" && \
	echo "export '$${name}_page.dart';" > "$$feature_path/page/pages.dart" && \
	echo "export 'data/data.dart';" > "$$feature_path/$${name}.dart" && \
	echo "export 'domain/domain.dart';" >> "$$feature_path/$${name}.dart" && \
	echo "export 'page/pages.dart';" >> "$$feature_path/$${name}.dart" && \
	echo "Feature structure created successfully at $$feature_path" || \
	(echo "Error: Failed to create files. Check disk space and permissions." && rm -rf "$$feature_path" && exit 1)

# Copy existing feature to new feature
# Usage:
# 1. make copy-feature origin=old_feature name=new_feature
# 2. make copy-feature (will prompt for origin and new feature names)
copy-feature:
	@if [ -z "$(origin)" ] || [ -z "$(name)" ]; then \
		if [ -z "$(origin)" ]; then \
			read -p "Enter origin feature name: " entered_origin; \
			origin=$$entered_origin; \
		fi; \
		if [ -z "$(name)" ]; then \
			read -p "Enter new feature name: " entered_name; \
			name=$$entered_name; \
		fi; \
	fi; \
	if [ -z "$$origin" ] || [ -z "$$name" ]; then \
		echo "Error: Both origin and new feature names are required"; \
		exit 1; \
	fi; \
	origin_path="lib/features/$$origin"; \
	feature_path="lib/features/$$name"; \
	if [ ! -d "$$origin_path" ]; then \
		echo "Error: Origin feature '$$origin' does not exist"; \
		exit 1; \
	fi; \
	if [ -d "$$feature_path" ]; then \
		echo "Warning: Feature '$$name' already exists"; \
		read -p "Do you want to overwrite? (y/n): " confirm; \
		if [ "$$confirm" != "y" ]; then \
			echo "Operation cancelled"; \
			exit 1; \
		fi; \
		rm -rf "$$feature_path"; \
	fi; \
	capitalized_origin=$$(echo "$$origin" | perl -pe 's/(\w+)/\u$$1/'); \
	capitalized_name=$$(echo "$$name" | perl -pe 's/(\w+)/\u$$1/'); \
	echo "Copying feature structure from $$origin to $$name..."; \
	cp -r "$$origin_path" "$$feature_path"; \
	find "$$feature_path" -type f -name "*.dart" -exec sed -i '' "s/$$origin/$$name/g" {} +; \
	find "$$feature_path" -type f -name "*.dart" -exec sed -i '' "s/$$capitalized_origin/$$capitalized_name/g" {} +; \
	find "$$feature_path" -type f -name "$$origin*" -exec sh -c ' \
		new_name="$$(echo "{}" | sed "s/$$0/$$1/")"; \
		mv "{}" "$$new_name"' "$$origin" "$$name" \;; \
	echo "Feature copied successfully from $$origin to $$name"