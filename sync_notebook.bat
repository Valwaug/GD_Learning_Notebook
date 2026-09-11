@echo off
echo Pulling any remote updates...
git pull origin main

echo Staging changes...
git add .

:: Check if there are any actual changes before committing
git diff --cached --quiet
if %errorlevel% neq 0 (
    echo Committing changes...
    git commit -m "Auto-sync notes: %date% %time%"
    echo Pushing to GitHub...
    git push origin main
    echo.
    echo ============================
    echo GitHub sync complete!
    echo ============================
) else (
    echo No changes to push. Everything is up to date!
)

timeout /t 3