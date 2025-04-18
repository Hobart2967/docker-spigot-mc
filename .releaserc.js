module.exports = {
	branches: ['main'],
	plugins: [
		[
			'@semantic-release/commit-analyzer',
			{
				preset: 'angular',
				releaseRules: [
					{ type: 'docs', scope: 'README', release: 'patch' },
					{ type: 'refactor', release: 'patch' },
					{ type: 'style', release: 'patch' },
				],
				parserOpts: {
					noteKeywords: ['BREAKING CHANGE', 'BREAKING CHANGES'],
				},
			},
		],
		'@semantic-release/release-notes-generator',
		'@semantic-release/github',
		[
			'@semantic-release/exec',
			{
				prepareCmd: './build.sh ${nextRelease.version}',
				publishCmd: './release.sh ${nextRelease.version}',
			},
		],
		[
			'@semantic-release/git',
			{
				assets: ['GoDough.csproj'],
				message:
					'chore(release): ${nextRelease.version} [skip ci]\n\n${nextRelease.notes}',
			},
		],
	],
};