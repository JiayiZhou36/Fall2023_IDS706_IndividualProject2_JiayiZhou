# Display Rust command-line utility versions
rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version              # Rust compiler
	cargo --version              # Rust package manager
	rustfmt --version            # Rust code formatter
	rustup --version             # Rust toolchain manager
	clippy-driver --version      # Rust linter

# Format code using rustfmt
format:
	cargo fmt --quiet

# Run clippy for linting
lint:
	cargo clippy --quiet

# Run tests
test:
	cargo test --quiet

# Build and run the project
run:
	cargo run

# Build release version
release:
	cargo build --release

# Install Rust toolchain if needed
install:
	# Install if needed
	# @echo "Updating rust toolchain"
	# rustup update stable
	# rustup default stable 

# Run all formatting, linting, and testing tasks
all: format lint test run

# Custom tasks

# Example: Extract data
extract: 
	cargo run extract

# Example: Transform and Load data
transform_load:
	cargo run transform_load

# Example: Create a database entry
create:
	cargo run query "INSERT INTO Goose (name, year, team, league, goose_eggs, broken_eggs, mehs, league_average_gpct, ppf, replacement_gpct, gwar, key_retro) VALUES ('Emma Watson', 1931, 'BSN', 'NL', 1, 0, 1, 0.67842, 99.0, 0.7342619, 0.1699602, 'watse101');"

# Example: Read from the database
read:
	cargo run query "SELECT * FROM Goose WHERE name='Emma Watson';"

# Example: Update a database entry
update:
	cargo run query "UPDATE Goose SET name='Emma Watson', year=1931, team='BSN', league='NL', goose_eggs=1, broken_eggs=0, mehs=1, league_average_gpct=0.769262, ppf=99.0, replacement_gpct=0.7342619, gwar=0.1699602, key_retro='watse101' WHERE id=1;"

# Example: Delete a database entry
delete:
	cargo run query "DELETE FROM Goose WHERE id=1;"

# Generate and push changes to GitHub
generate_and_push:
	@if [ -n "$$(git status --porcelain)" ]; then \
		git config --local user.email "action@github.com"; \
		git config --local user.name "GitHub Action"; \
		git add .; \
		git commit -m "Add query log"; \
		git push; \
	else \
		echo "No changes to commit. Skipping commit and push."; \
	fi
