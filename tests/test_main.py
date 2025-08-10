"""Tests for main module."""

from unittest.mock import patch

from main import main


def test_main_prints_hello() -> None:
    """Test that main function prints the expected message."""
    with patch("builtins.print") as mock_print:
        main()
        mock_print.assert_called_once_with("Hello from rag-expriment!")


def test_main_function_exists() -> None:
    """Test that main function exists and is callable."""
    assert callable(main)
